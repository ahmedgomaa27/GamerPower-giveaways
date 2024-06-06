//
//  GiveawayModel.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 02/06/2024.
//

import Foundation

struct GiveawayModel: Decodable {
    let id: Int
    let title: String
    let description: String
    let image: String
    let thumbnail: String
    let worth: String
    let platforms: String
    let end_date: String
    let users: Int
    let open_giveaway: String
    let type: String
    
    func convertToVM() -> GiveawayVM {
        GiveawayVM(dataModel: self)
    }
}
