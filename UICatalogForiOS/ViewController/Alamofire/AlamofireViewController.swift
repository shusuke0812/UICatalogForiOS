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
// MARK: - UISearchBar Delegate
extension AlamofireViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchWord = searchBar.text else { return }
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
            self.tableView.reloadData()
        }
    }
    func didFailedGetGitHubRepositorys(errorMessaage: String) {
        print("DEBUG: ", errorMessaage)
    }
}
