//
//  GiveawayVM.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 04/06/2024.
//

import Observation

@Observable
class GiveawayVM: Identifiable {

    let id: Int
    let title: String
    let description: String
    let price: String
    let image: String
    let thumbnail: String
    let platforms: String
    let endDate: String
    let users: String
    let giveawayUrl: String
    let type: String
    var isFavorite = false
    
    
    init(dataModel: GiveawayModel) {
        self.id = dataModel.id
        self.title = dataModel.title
        self.description = dataModel.description
        self.price = dataModel.worth
        self.image = dataModel.image
        self.thumbnail = dataModel.thumbnail
        self.platforms = dataModel.platforms
        self.endDate = dataModel.end_date.formattedDate()
        self.users = dataModel.users.formatted()
        self.giveawayUrl = dataModel.open_giveaway
        self.type = dataModel.type
    }
}
