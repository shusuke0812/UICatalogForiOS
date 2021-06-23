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
    /// ページ番号
    let page = 20
    
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
            "page": self.page
        ]
    }
    var headers: HTTPHeaders? {
        nil
    }
    var body: Data? {
        nil
    }
}
