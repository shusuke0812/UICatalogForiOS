//
//  ToastViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2021/1/16.
//  Copyright © 2021 shusuke. All rights reserved.
//

import UIKit
import Toast_Swift

class ToastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Action Method
    @IBAction func didTapTextButton(_ sender: Any) {
        self.showTextToast()
    }
    @IBAction func didTapTextImageButton(_ sender: Any) {
        self.showTextAndImageToast()
    }
    @IBAction func didTapActivityButton(_ sender: Any) {
        self.showActivityToast()
    }
    @IBAction func didTapCustomViewButton(_ sender: Any) {
        self.showCustomViewToast()
    }
}
// MARK: - Private Method
extension ToastViewController {
    private func showTextToast() {
        self.view.makeToast("Hello World !!", duration: 1.0, position: .bottom)
    }
    private func showTextAndImageToast() {
        self.view.makeToast("Hello World !!", duration: 1.0, position: .bottom, title: "画像付きトースト", image: UIImage(named: "sample_image")) { didTap in
            if didTap {
                print("DEBUG: 画像付きトーストがタップされました")
            } else {
                print("DEBUG: 画像付きトーストがタップされませんでした")
            }
        }
    }
    private func showActivityToast() {
        self.view.makeToastActivity(.center)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.view.hideToastActivity()
        }
    }
    // TODO: カスタムビューをトースト表示できない
    private func showCustomViewToast() {
        //let customView = ToastView()
        let customView = UIView()
        customView.backgroundColor = .red
        customView.frame.size.width = 100
        customView.frame.size.height = 100
        self.view.showToast(customView, duration: 2.0, position: .center)
    }
}
