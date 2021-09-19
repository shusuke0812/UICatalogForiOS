//
//  APIClient.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2021/6/23.
//  Copyright © 2021 shusuke. All rights reserved.
//

import Alamofire

protocol AlamofireAPIClientProtocol {
    func sendRequest<T: GitHubAPIRequest>(_ request: T, completion: @escaping (Result<T.Response, APIClientError>) -> Void)
}
class AlamofireAPIClient: AlamofireAPIClientProtocol {
    /// シングルトン
    static let shared = AlamofireAPIClient()
    
    private init() {}
}
extension AlamofireAPIClient {
    func sendRequest<T: GitHubAPIRequest>(_ request: T, completion: @escaping (Result<T.Response, APIClientError>) -> Void) {
        let url = request.baseURL + request.path
        AF.request(url, method: request.method, parameters: request.parameters, encoding: URLEncoding(destination: .queryString), headers: request.headers).responseJSON { response in
            guard let data = response.data else {
                return
            }
            let decoder = JSONDecoder()
            if (200..<300).contains(response.response!.statusCode) {
                do {
                    let apiResponse = try decoder.decode(T.Response.self, from: data)
                    completion(.success(apiResponse))
                } catch {
                    completion(.failure(.responseParseError(error)))
                }
            } else {
                do {
                    let apiError = try decoder.decode(GitHubAPIError.self, from: data)
                    completion(.failure(.apiError(apiError)))
                } catch {
                    completion(.failure(.responseParseError(error)))
                }
            }
        }
    }
}
