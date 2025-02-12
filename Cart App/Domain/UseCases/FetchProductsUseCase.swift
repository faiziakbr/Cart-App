//
//  FetchProductsUseCase.swift
//  Cart App
//
//  Created by Faizan Akbar on 12/02/2025.
//
import Combine

final class FetchProductsUseCase {
    private let repository: ProductRepository
    
    init(repository: ProductRepository = ProductRepositoryImp(remoteDataSource: ProductRemoteDataSource())) {
        self.repository = repository
    }
    
    func execute(limit: Int, skip: Int) -> AnyPublisher<WelcomeModel, Error>{
        return repository.getProducts(limit: limit, skip: skip)
    }
}
