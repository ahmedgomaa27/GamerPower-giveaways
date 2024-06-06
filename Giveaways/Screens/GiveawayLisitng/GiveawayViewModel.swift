//
//  GiveawayViewModel.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 02/06/2024.
//

import SwiftUI
import Combine

class GiveawayViewModel: ObservableObject {

    @Published var giveaways: [GiveawayVM] = []
    @Published var showLoading = false
    @Published var errorMessage: String?

    let service: GiveawayServiceProtocol
    
    init(service: GiveawayServiceProtocol = GiveawayService()) {
        self.service = service
    }
    
    func fetchGiveaways(selectedPlatform: Constants.Platfroms) async {
       await fetchGiveaways(parameters: getParameters(selectedPlatform: selectedPlatform))
    }
    
    func fetchGiveaways(parameters: [String: Any]) async {
        DispatchQueue.main.async {
            self.showLoading = true
        }

        do {
            let result = try await service.getList(parameters: parameters)
            DispatchQueue.main.sync {
                self.giveaways = result.map({ $0.convertToVM() })
                self.errorMessage = nil
                self.showLoading = false
            }
        } catch {
            DispatchQueue.main.sync {
                self.errorMessage = (error as? AppErrors)?.errorMsg
                self.showLoading = false
            }
        }
    }
    
    private func getParameters(selectedPlatform: Constants.Platfroms) -> [String: Any] {
        switch selectedPlatform {
        case .all:
            [:]
        default:
            ["platform": selectedPlatform.rawValue]
        }
    }
}
