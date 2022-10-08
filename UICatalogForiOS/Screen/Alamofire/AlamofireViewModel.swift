//
//  AlamofireViewModel.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/12/22.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

protocol AlamofireViewModeDelegate: AnyObject {
    func didSuccessGetGitHubRepositorys()
    func didFailedGetGitHubRepositorys(errorMessaage: String)
}

class AlamofireViewModel: NSObject {
    /// GitHubリポジトリのリポジトリクラス
    private let gitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol
    /// GitHubリポジトリー
    var gitHubRepositorys: [GitHubRepositoryItem] = []
    /// デリゲート
    weak var delegate: AlamofireViewModeDelegate?
    /// TableViewのセクション
    var sections: Int = 1
    
    init(gitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol) {
        self.gitHubRepositorySearchRepository = gitHubRepositorySearchRepository
    }
}
// MARK: - API Method
extension AlamofireViewModel {
    func getGitHubRepositorys(searchWord: String) {
        self.gitHubRepositorySearchRepository.getGitHubRepositories(searchWord: searchWord) { response in
            switch response {
            case .success(let response):
                self.gitHubRepositorys = response.items
                self.delegate?.didSuccessGetGitHubRepositorys()
            case .failure(let error):
                self.delegate?.didFailedGetGitHubRepositorys(errorMessaage: "検索に失敗しました")
            }
        }
    }
}
// MARK: - TableView DataSource Method
extension AlamofireViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.gitHubRepositorys.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlamofireTableViewCell.reuseIdentifier, for: indexPath) as! AlamofireTableViewCell
        let gitHubRepository = self.gitHubRepositorys[indexPath.row]
        cell.configLabel(title: gitHubRepository.fullName, star: gitHubRepository.starCount)
        return cell
    }
}
