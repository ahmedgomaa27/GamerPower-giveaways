//
//  AppTarget.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 02/06/2024.
//

import Foundation
import Moya

enum AppTarget {
    case giveawaysList(parameters: [String: Any])
}

extension AppTarget: TargetType {
    var baseURL: URL {
        URL(string: "https://www.gamerpower.com/api/")!
    }
    
    var path: String {
        "giveaways"
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self {
        case .giveawaysList(let parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
    
    
}
