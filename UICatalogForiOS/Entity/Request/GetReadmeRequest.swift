//
//  GetReadmeRequest.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2021/9/24.
//  Copyright © 2021 shusuke. All rights reserved.
//

import Alamofire

struct GetReadmeRequest: GitHubAPIRequest {
    /// リポジトリアカウント名
    let ownerName: String
    /// リポジトリ名
    let repositoryName: String
    
    // GitHubAPIRequestが要求する連想型
    typealias Response = GitHubReadme
    
    var path: String {
        "/repos/\(self.ownerName)/\(self.repositoryName)/readme"
    }
    var method: HTTPMethod {
        .get
    }
    var parameters: Parameters? {
        nil
    }
    var headers: HTTPHeaders? {
        nil
    }
    var body: Data? {
        nil
    }
}
