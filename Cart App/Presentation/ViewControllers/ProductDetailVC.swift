//
//  ProductDetailVC.swift
//  Cart App
//
//  Created by Faizan Akbar on 12/02/2025.
//
import SwiftUI

final class ProductDetailVC: UIViewController {
    
    private let viewModel: ProductDetailViewModel
    private lazy var productDetailView = ProductDetailSwiftUI(product: viewModel.product)
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hostingController = UIHostingController(rootView: productDetailView)
        addChild(hostingController)
        hostingController.view.frame = view.bounds
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
