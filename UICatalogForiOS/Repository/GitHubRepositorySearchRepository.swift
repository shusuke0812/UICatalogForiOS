//
//  AlamofireRepository.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/12/22.
//  Copyright © 2020 shusuke. All rights reserved.
//

import Foundation

protocol GitHubRepositorySearchRepositoryProtocol {
    /// Googleスプレッドシートのデータを取得する
    func getGitHubRepositories(request: URLRequest, completion: @escaping (Result<GitHubRepositoryItem, Error>) -> Void)
}

class GitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol {
}
// MARK: - API Method
extension GitHubRepositorySearchRepository {
    func getGitHubRepositories(request: URLRequest, completion: @escaping (Result<GitHubRepositoryItem, Error>) -> Void) {
        
    }
}
