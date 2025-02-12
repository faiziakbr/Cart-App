//
//  ProductView.swift
//  Cart App
//
//  Created by Faizan Akbar on 12/02/2025.
//

import UIKit

final class ProductView: UIView {
    
    private let headerView = UIView()
    private let headerLbl = UILabel()
    private(set) var searchBar = UISearchBar()
    private(set) var productsTV = UITableView()
    private(set) var refreshControl = UIRefreshControl()
    
    weak var controller: ProductVC? {
        didSet {
            refreshControl.addTarget(controller, action: #selector(controller?.refreshData), for: .valueChanged)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupAllViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAllViews() {
        setupHeaderView()
        setupSearchBar()
        setupTableView()
    }
    
    private func setupHeaderView() {
        addSubview(headerView)
//        headerView.backgroundColor = .red
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        headerView.addSubview(headerLbl)
        headerLbl.text = "PRODUCTS"
        headerLbl.textColor = .black
        headerLbl.font = UIFont.boldSystemFont(ofSize: 20)
        headerLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0),
            headerLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0),
        ])
    }
    
    private func setupSearchBar() {
        addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.returnKeyType = .done
        searchBar.searchTextField.textColor = .black
        searchBar.backgroundColor = .clear
        searchBar.showsCancelButton = false
        searchBar.autocorrectionType = .no
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search by title",
            attributes: [.foregroundColor: UIColor.gray]
        )
        searchBar.searchTextField.leftView?.tintColor = UIColor.black
        searchBar.sizeToFit()
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupTableView() {
        addSubview(productsTV)
        productsTV.translatesAutoresizingMaskIntoConstraints = false
        productsTV.backgroundColor = .white
        productsTV.keyboardDismissMode = .onDrag
        setupRefreshControl()
        NSLayoutConstraint.activate([
            productsTV.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0),
            productsTV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            productsTV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            productsTV.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        func setupRefreshControl() {
            refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
            
            productsTV.refreshControl = refreshControl
        }
    }
}
