//
//  ImageViewerOnTableViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/11/5.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class ImageViewerOnTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUIControl()
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
