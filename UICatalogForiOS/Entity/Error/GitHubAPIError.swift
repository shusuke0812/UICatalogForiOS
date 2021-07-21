//
//  GitHubAPIError.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2021/7/21.
//  Copyright © 2021 shusuke. All rights reserved.
//

import Foundation

struct GitHubAPIError: Error {
    var message: String
    var errors: [FieldError]
    
    enum CodingKeys: String, CodingKey {
        case message
        case errors
    }
}
struct FieldError: Error {
    var resorce: String
    var field: String
    var missingField: String
    
    enum CodingKeys: String, CodingKey {
        case resorce
        case field
        case missingField = "missing_field"
    }
}
