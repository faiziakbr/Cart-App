//
//  ProductRepository.swift
//  Cart App
//
//  Created by Faizan Akbar on 12/02/2025.
//

import Combine

protocol ProductRepository {
    func getProducts(limit: Int, skip: Int) -> AnyPublisher<WelcomeModel, Error>
}

final class ProductRepositoryImp: ProductRepository {
    
    private let remoteDataSource: ProductRemoteDataSource
    
    init(remoteDataSource: ProductRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getProducts(limit: Int, skip: Int) -> AnyPublisher<WelcomeModel, any Error> {
        return remoteDataSource.fetchProducts(limit: limit, skip: skip)
    }
}
