//
//  AlamofireViewModel.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/12/22.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class AlamofireViewModel: NSObject {
    /// GitHubリポジトリのリポジトリクラス
    private var gitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol
    /// GitHubリポジトリー
    var gitHubRepositories: [GitHubRepositoryItem] = []
    /// TableViewのセクション
    var sections: Int = 0
    
    init(gitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol) {
        self.gitHubRepositorySearchRepository = gitHubRepositorySearchRepository
    }
}
// MARK: - API Method
extension AlamofireViewModel {
    
}
// MARK: - TableView DataSource Method
extension AlamofireViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.gitHubRepositories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlamofireTableViewCell", for: indexPath) as! AlamofireTableViewCell
        return cell
    }
}
