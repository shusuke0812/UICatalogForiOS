//
//  GitHubReadme.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2021/9/23.
//  Copyright © 2021 shusuke. All rights reserved.
//

import Foundation

struct GitHubReadme: Codable {
    /// URL（HTML）
    let htmlUrl: String
    
    enum CodingKeys: String, CodingKey {
        case htmlUrl = "html_url"
    }
    init(htmlUrl: String) {
        self.htmlUrl = htmlUrl
    }
}
