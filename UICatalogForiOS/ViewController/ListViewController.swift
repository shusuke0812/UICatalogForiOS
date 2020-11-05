//
//  ListViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/9/22.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    /// BaseView
    private var baseView: ListBaseView { return self.view as! ListBaseView}
    /// ViewModel
    private var viewModel: ListViewModel!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ListViewModel()
        self.setBaseView()
    }
}
// MARK: - Initialized Method
extension ListViewController {
    private func setBaseView() {
        self.baseView.tableView.tableFooterView = UIView()
        self.baseView.tableView.delegate = self
        self.baseView.tableView.dataSource = self.viewModel
    }
}

// MARK: - TableView Delegate Methop
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionType: ListSectionType = self.viewModel.sections[indexPath.section]
        switch  sectionType {
        case .ui:
            return 50
        case .image:
            return 50
        case .interaction:
            return 50
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルの選択を解除
        self.baseView.tableView.deselectRow(at: indexPath, animated: true)
        // セル選択後の処理
        let sectionRowType: ListRowType = self.viewModel.sections[indexPath.section].rows[indexPath.row]
        switch sectionRowType {
        case .mxparallax:
            print("DEBUG： mxparallaxがタップされました")
        case .xlpager:
            print("DEBUG： xlpagerがタップされました")
        case .tocrop:
            print("DEBUG： tocropがタップされました")
            self.transitionTOCropViewController()
        case .imageViewer:
            print("DEBUG： imageViewerがタップされました")
            self.transitionImageViewer()
        case .imageViewerOnTableView:
            print("DEBUG： imageViewerOnTableviewがタップされました")
            self.transitionImageViewerOnTableView()
        case .hud:
            print("DEBUG： pkhudがタップされました")
            self.transitionPkHud()
        }
    }
}
// MARK: - Other Private Method
extension ListViewController {
    // TODO： VC生成のコードが重複しているのでうまくまとめる方法を考える
    private func transitionTOCropViewController() {
        let s: UIStoryboard = UIStoryboard(name: "TOCropViewControllerSample", bundle: nil)
        let vc: TOCropViewControllerSample = s.instantiateInitialViewController() as! TOCropViewControllerSample
        self.present(vc, animated: true, completion: nil)
    }
    private func transitionImageViewer() {
        let s: UIStoryboard = UIStoryboard(name: "ImageViewerViewController", bundle: nil)
        let vc: ImageViewerViewController = s.instantiateInitialViewController() as! ImageViewerViewController
        self.present(vc, animated: true, completion: nil)
    }
    private func transitionImageViewerOnTableView() {
        let s: UIStoryboard = UIStoryboard(name: "ImageViewerOnTableViewController", bundle: nil)
        let vc: ImageViewerOnTableViewController = s.instantiateInitialViewController() as! ImageViewerOnTableViewController
        self.present(vc, animated: true, completion: nil)
    }
    private func transitionPkHud() {
        let s: UIStoryboard = UIStoryboard(name: "PkhudViewController", bundle: nil)
        let vc: PkhudViewController = s.instantiateInitialViewController() as! PkhudViewController
        self.present(vc, animated: true, completion: nil)
    }
}
