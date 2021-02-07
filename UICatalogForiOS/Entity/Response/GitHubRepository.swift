//
//  GoogleSpreadSheet.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/12/22.
//  Copyright © 2020 shusuke. All rights reserved.
//

import Foundation

struct GitHubRepository: Codable {
    let totalCount: Int
    let items: [GitHubRepositoryItem]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}

struct GitHubRepositoryItem: Codable {
    /// アカウント名 + リポジトリ名
    let fullName: String
    /// お気に入り登録数
    let starCount: Int
    
    enum CodingKeys: String, CodingKey {
        case fullName   = "full_name"
        case starCount  = "stargazers_count"
    }
}
