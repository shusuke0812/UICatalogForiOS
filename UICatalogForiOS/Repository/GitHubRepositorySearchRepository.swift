//
//  AlamofireRepository.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/12/22.
//  Copyright © 2020 shusuke. All rights reserved.
//

import Foundation

protocol GitHubRepositorySearchRepositoryProtocol {
    /// GitHubのリポジトリを取得する
    /// - Parameters:
    ///   - searchWord: 検索ワード
    func getGitHubRepositories(searchWord: String, completion: @escaping (Result<GitHubRepository, Error>) -> Void)
}

class GitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol {
}
// MARK: - API Method
extension GitHubRepositorySearchRepository {
    func getGitHubRepositories(searchWord: String, completion: @escaping (Result<GitHubRepository, Error>) -> Void) {
        let request = SearchRepositoriesRequest(searchWord: searchWord)
        AlamofireAPIClient.shared.sendRequest(request) { result in
            switch result {
            case . success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
