//
//  ImageViewerOnTableViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/11/5.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class ImageViewerOnTableViewController: UIViewController {
    
    /// BaseView
    private var baseView: ImageViewerOnTableViewBaseView { self.view as! ImageViewerOnTableViewBaseView}
    /// ViewModel
    private var viewModel: ImageViewerOnTableViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUIControl()
        self.viewModel = ImageViewerOnTableViewModel()
    }
    // MARK: - Action Method
    @IBAction func didTapCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
// MARK: - Initialized Method
extension ImageViewerOnTableViewController {
    private func setUIControl() {
        // モーダル画面をスワイプで閉じれないようにする
        self.isModalInPresentation = true
    }
}
// MARK: - TableView Delegate Method
extension ImageViewerOnTableViewController: UITableViewDelegate {
    private func setTableView() {
        self.baseView.tableView.delegate = self
        self.baseView.tableView.dataSource = self.viewModel
        self.baseView.tableViewWithCollectionView.delegate = self
        self.baseView.tableViewWithCollectionView.dataSource = self.viewModel
    }
}
