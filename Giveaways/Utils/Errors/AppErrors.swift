//
//  AppErrors.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 02/06/2024.
//

import Foundation

enum AppErrors: Error {

    case invalidRequest(errorMsg: String)
    case invalidParsing(errorMsg: String)
    
    var errorMsg: String {
        switch self {
        case .invalidRequest(let errorMsg),
                .invalidParsing(let errorMsg):
            errorMsg
        }
    }
}
