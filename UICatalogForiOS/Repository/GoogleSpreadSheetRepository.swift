//
//  AlamofireRepository.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/12/22.
//  Copyright © 2020 shusuke. All rights reserved.
//

import Foundation

protocol GoogleSpreadSheetRepositoryProtocol {
    /// Googleスプレッドシートのデータを取得する
    func getGoogleSpreadSheet(uid: String, completion: @escaping (Result<GoogleSpreadSheet, Error>) -> Void)
}

class GoogleSpreadSheetRepository: GoogleSpreadSheetRepositoryProtocol {
}

extension GoogleSpreadSheetRepository {
    func getGoogleSpreadSheet(uid: String,
                              completion: @escaping (Result<GoogleSpreadSheet, Error>) -> Void) {
        <#code#>
    }
}
