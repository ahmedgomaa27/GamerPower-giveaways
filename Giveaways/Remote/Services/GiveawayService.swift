//
//  GiveawayService.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 02/06/2024.
//

import Foundation

protocol GiveawayServiceProtocol {
    func getList(parameters: [String: Any]) async throws -> [GiveawayModel]
}


final class GiveawayService: GiveawayServiceProtocol {
    
    private let httpClient: HttpClientProtocol
    
    init(httpClient: HttpClientProtocol = HttpClient.shared) {
        self.httpClient = httpClient
    }
    
    func getList(parameters: [String : Any]) async throws -> [GiveawayModel] {
        let target = AppTarget.giveawaysList(parameters: parameters)
        return try await httpClient.execute(target)
    }
}
