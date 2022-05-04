//
//  GitHubModel.swift
//  SampleMoya
//
//  Created by Makoto on 2022/05/01.
//

import Foundation

struct APIResponse: Codable {
    
    let items: [GitHubModel]?
}

struct GitHubModel: Codable {
    
    let fullName: String
    var urlStr: String { "https://github.com/\(fullName)" }
    
    enum CodingKeys: String, CodingKey {
        
        case fullName = "full_name"
    }
}
