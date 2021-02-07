//
//  SearchRepositoriesRequest.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2021/2/7.
//  Copyright © 2021 shusuke. All rights reserved.
//

import Alamofire

struct SearchRepositoriesRequest: GitHubAPIRequest {
    /// 検索ワード
    let searchWord: String
    
    // GitHubAPIRequestが要求する連想型
    typealias Response = GitHubRepository
    
    var path: String {
        "/seach/repositories"
    }
    var method: HTTPMethod {
        .get
    }
    var parameters: Parameters? {
        [
            "q": self.searchWord,
            "page": 20
        ]
    }
    var headers: HTTPHeaders? {
        nil
    }
    var body: GitHubRepository? {
        nil
    }
}
