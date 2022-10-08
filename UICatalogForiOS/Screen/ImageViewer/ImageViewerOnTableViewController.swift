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
        self.viewModel = ImageViewerOnTableViewModel()
        self.setUIControl()
        self.setTableView()
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
        // デリゲート
        self.baseView.tableView.delegate = self
        self.baseView.tableView.dataSource = self.viewModel
        self.baseView.tableViewWithCollectionView.delegate = self
        self.baseView.tableViewWithCollectionView.dataSource = self.viewModel
        // セル選択無効化
        self.baseView.tableView.allowsSelection = false
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルの選択を解除
        self.baseView.tableView.deselectRow(at: indexPath, animated: true)
        self.baseView.tableViewWithCollectionView.deselectRow(at: indexPath, animated: true)
    }
}
