//
//  APIClient.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2021/6/23.
//  Copyright © 2021 shusuke. All rights reserved.
//

import Alamofire

protocol APIClientProtocol {
    func sendRequest<T: GitHubAPIRequest>(_ request: T, completion: @escaping (Result<T.Response, Error>) -> Void)
}
class APIClient: APIClientProtocol {
    /// シングルトン
    static let shared = APIClient()
    
    private init() {}
}
extension APIClient {
    func sendRequest<T: GitHubAPIRequest>(_ request: T, completion: @escaping (Result<T.Response, Error>) -> Void) {
        let url = request.baseURL + request.path
        AF.request(url, method: request.method, parameters: request.parameters, encoding: URLEncoding(destination: .queryString), headers: request.headers).responseJSON { response in
            // MEMO: response.resultの結果によって処理を分けたほうが良いかも
            guard let data = response.data else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let apiResponse = try decoder.decode(T.Response.self, from: data)
                completion(.success(apiResponse))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
