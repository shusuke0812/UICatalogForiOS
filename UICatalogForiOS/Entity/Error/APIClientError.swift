//
//  APIClientError.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2021/7/21.
//  Copyright © 2021 shusuke. All rights reserved.
//

import Foundation

enum APIClientError: Error {
    case connectionError(Error)
    case responseParseError(Error)
    case apiError(GitHubAPIError)
    case unknown
    
    func description() -> String {
        switch self {
        case .connectionError:      return "通信に失敗"
        case .responseParseError:   return "レスポンスの変換に失敗"
        case .apiError:             return "サーバーエラー"
        case .unknown:              return "不明なエラー"
        }
    }
}
