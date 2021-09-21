//
//  AlamofireViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/12/22.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class AlamofireViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    /// ViewModel
    private var viewModel: AlamofireViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = AlamofireViewModel(gitHubRepositorySearchRepository: GitHubRepositorySearchRepository())
        self.setDelegate()
        
        self.tableView.register(AlamofireTableViewCell.initiate(), forCellReuseIdentifier: AlamofireTableViewCell.reuseIdentifier)
        self.tableView.tableFooterView = UIView()
        self.setBackgroundTableView()
    }
}
// MARK: - Init
extension AlamofireViewController {
    private func setDelegate() {
        self.searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self.viewModel
        self.viewModel.delegate = self
    }
}
// MARK: - Setting
extension AlamofireViewController {
    private func setBackgroundTableView() {
        if self.viewModel.gitHubRepositorys.isEmpty {
            let searchNoResultLabel = UILabel(frame: .zero)
            searchNoResultLabel.text = "検索結果がありません"
            searchNoResultLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .heavy)
            searchNoResultLabel.textColor = .lightGray
            searchNoResultLabel.textAlignment = .center
            
            self.tableView.backgroundView = searchNoResultLabel
        } else {
            self.tableView.backgroundView = nil
        }
    }
}

// MARK: - UISearchBar Delegate
extension AlamofireViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchWord = searchBar.text, !searchWord.isEmpty else { return }
        self.tableView.backgroundView = nil
        LoadIndicatorManager.shared.startAnimation(vc: self)
        self.viewModel.getGitHubRepositorys(searchWord: searchWord)
        self.searchBar.endEditing(true)
    }
}
// MARK: - TableView Delegate
extension AlamofireViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
// MARK: - ViewModel Delegate
extension AlamofireViewController: AlamofireViewModeDelegate {
    func didSuccessGetGitHubRepositorys() {
        DispatchQueue.main.async {
            LoadIndicatorManager.shared.stopAnimation(vc: self)
            self.setBackgroundTableView()
            self.tableView.reloadData()
        }
    }
    func didFailedGetGitHubRepositorys(errorMessaage: String) {
        print("DEBUG: ", errorMessaage)
        DispatchQueue.main.async {
            LoadIndicatorManager.shared.stopAnimation(vc: self)
        }
    }
}
