//
//  MockGiveawayService.swift
//  GiveawaysTests
//
//  Created by Ahmed Hamdy on 05/06/2024.
//

@testable import Giveaways

class MockGiveawayService: GiveawayServiceProtocol {
    
    var throwError = false

    func getList(parameters: [String : Any]) async throws -> [GiveawayModel] {
        if throwError {
            throw AppErrors.invalidRequest(errorMsg: "Error")
        } else {
            return [GiveawayModel(
                id: 0,
                title: "",
                description: "",
                image: "",
                thumbnail: "",
                worth: "",
                platforms: "",
                end_date: "",
                users: 0,
                open_giveaway: "",
                type: ""
            )]
        }
    }
    
}
