//
//  HttpClient.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 02/06/2024.
//

import Foundation
import Moya

protocol HttpClientProtocol {
    func execute<T: Decodable>(_ target: AppTarget) async throws -> T
}

final class HttpClient: HttpClientProtocol {
    
    static let shared = HttpClient()
    
    private let provider: MoyaProvider<AppTarget>
    
    private init(provider: MoyaProvider<AppTarget> = MoyaProvider<AppTarget>()) {
        self.provider = provider
    }
    
    func execute<T>(_ target: AppTarget) async throws -> T where T : Decodable {
        let result = await request(target)
        switch result {
        case .success(let response):
            do {
                let data = try JSONDecoder().decode(T.self, from: response.data)
                return data
            } catch {
                throw AppErrors.invalidParsing(errorMsg: error.localizedDescription)
            }
        case .failure(let error):
            throw AppErrors.invalidRequest(errorMsg: error.localizedDescription)
        }
    }
    
    private func request(_ target: AppTarget) async -> Result<Moya.Response, MoyaError> {
        await withCheckedContinuation { continuation in
            provider.request(target) { result in
                continuation.resume(returning: result)
            }
        }
    }
}
