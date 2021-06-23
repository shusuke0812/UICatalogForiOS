//
//  GitHubAPIRequest.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2021/2/7.
//  Copyright © 2021 shusuke. All rights reserved.
//

import Foundation
import Alamofire

protocol GitHubAPIRequest {
    associatedtype Response: Decodable
    
    var baseURL: String { get }
    var path: String { get }
    var method: Alamofire.HTTPMethod { get }
    var parameters:  Alamofire.Parameters? { get }
    var headers: Alamofire.HTTPHeaders? { get }
    var body: Data? { get }
}
// MARK: - Custom Setting
extension GitHubAPIRequest {
    /// APIプレフィックス
    var baseURL: String {
        "https://api.github.com"
    }
}
