//
//  ViewController.swift
//  Cart App
//
//  Created by Faizan Akbar on 12/02/2025.
//

import UIKit
import Combine
import SwiftUI

final class ProductVC: UIViewController {
    
    private let contentView = ProductView()
    private let viewModel = ProductViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func loadView() {
        super.loadView()
        navigationController?.setNavigationBarHidden(true, animated: false)
        contentView.controller = self
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDelegates()
        setupBindings()
        viewModel.fetchProducts()
    }
    
    private func setupBindings() {
        viewModel.$isLoading
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] isLoading in
                guard let self else { return }
                if !isLoading {
                    contentView.refreshControl.endRefreshing()
                }
                contentView.productsTV.reloadData()
            }
            .store(in: &cancellables)
        
        viewModel.$filteredProducts
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                contentView.productsTV.reloadData()
            }
            .store(in: &cancellables)
    }
    
    private func setupViewDelegates() {
        contentView.productsTV.delegate = self
        contentView.productsTV.dataSource = self
        contentView.searchBar.delegate = self
        contentView.productsTV.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseID)
    }
    
    @objc func refreshData() {
        viewModel.reloadAllData()
    }

}

extension ProductVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !viewModel.filteredProducts.isEmpty {
            return viewModel.filteredProducts.count
        } else {
            return viewModel.isLoading ? 10 : 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseID, for: indexPath) as? ProductCell
        guard let cell else { return UITableViewCell() }
        
        viewModel.isLoading ? cell.setTemplateWithSubviews(true, viewBackgroundColor: UIColor.gray) : cell.setTemplateWithSubviews(false)
        
        if viewModel.filteredProducts.indices.contains(indexPath.row) {
            cell.configure(with: viewModel.filteredProducts[indexPath.row], indexPath: indexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.filteredProducts.indices.contains(indexPath.row) {
            let detail = ProductDetailVC(viewModel: ProductDetailViewModel(product: viewModel.filteredProducts[indexPath.row]))
            navigationController?.pushViewController(detail, animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let tableViewHeight = scrollView.frame.size.height
        
        if offsetY > contentHeight - tableViewHeight - 100 {
            if !viewModel.isLoading && viewModel.originalproducts.count < viewModel.maxLimit {
                viewModel.fetchProducts()
            }
        }
    }
    
}

extension ProductVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchBar.text ?? ""
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

