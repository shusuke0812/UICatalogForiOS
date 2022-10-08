//
//  GiitHubReadmeRepository.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2021/9/23.
//  Copyright © 2021 shusuke. All rights reserved.
//

import Foundation

protocol GitHubReadmeRepositoryProtocol {
    /// GitHubリポジトリのREADMEを取得する
    /// - Parameters:
    ///  - ownerName: リポジトリアカウント名
    ///  - repositoryName: リポジトリ名
    ///  - completion: README取得の成功、失敗ハンドル
    func getRepositoryReadme(ownerName: String, repositoryName: String, completion: @escaping (Result<GitHubReadme, APIClientError>) -> Void)
}

class GitHubReadmeRepository: GitHubReadmeRepositoryProtocol {
}

// MARK: - API Method [GET]
extension GitHubReadmeRepository {
    func getRepositoryReadme(ownerName: String, repositoryName: String, completion: @escaping (Result<GitHubReadme, APIClientError>) -> Void) {
        let request = GetReadmeRequest(ownerName: ownerName, repositoryName: repositoryName)
        AlamofireAPIClient.shared.sendRequest(request) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
