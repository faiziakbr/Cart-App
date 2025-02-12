//
//  ProductCell.swift
//  Cart App
//
//  Created by Faizan Akbar on 12/02/2025.
//

import SwiftUI
import SDWebImage
import UIView_Shimmer

final class ProductCell: UITableViewCell, ShimmeringViewProtocol {
    static let reuseID = "product_cell"
    
    var shimmeringAnimatedItems: [UIView] {
        [
            productImageView,
            nameLabel,
            priceLabel,
            expiryLabel,
            yearLabel,
            distanceLabel
        ]
    }
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let expiryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        selectionStyle = .none
        layer.cornerRadius = 10
                layer.shadowColor = UIColor.black.cgColor
                layer.shadowOpacity = 0.2
                layer.shadowOffset = CGSize(width: 0, height: 2)
                layer.shadowRadius = 4
        setupCell()
    }
    
    func configure(with product: ProductModel, indexPath: IndexPath) {
        productImageView.sd_setImage(with: URL(string: product.thumbnail), placeholderImage: UIImage(named: "placeholder"))
        nameLabel.text = product.title
        priceLabel.text = "Starting Price: \(product.price)"
        expiryLabel.text = "Brand \(product.brand ?? "--")"
        yearLabel.text = "Rating \(product.rating)"
        distanceLabel.text = "Discount % \(product.discountPercentage)"
    }
    
    
    private func setupCell() {
        contentView.addSubview(productImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(expiryLabel)
        stackView.addArrangedSubview(yearLabel)
        stackView.addArrangedSubview(distanceLabel)
        contentView.addSubview(stackView)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            productImageView.heightAnchor.constraint(equalToConstant: 130),
            
            nameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            expiryLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            expiryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            stackView.topAnchor.constraint(equalTo: expiryLabel.bottomAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
