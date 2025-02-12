//
//  ProductModel.swift
//  Cart App
//
//  Created by Faizan Akbar on 12/02/2025.
//

struct WelcomeModel: Codable {
    let products: [ProductModel]
    let total: Int
}

struct ProductModel: Codable {
    let id: Int
    let title, description: String
//    let category: Category
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
//    let dimensions: Dimensions
    let warrantyInformation, shippingInformation: String
//    let availabilityStatus: AvailabilityStatus
//    let reviews: [Review]
//    let returnPolicy: ReturnPolicy
    let minimumOrderQuantity: Int
//    let meta: Meta
    let images: [String]
    let thumbnail: String
}
