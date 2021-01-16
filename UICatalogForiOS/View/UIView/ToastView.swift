//
//  ToastView.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2021/1/16.
//  Copyright © 2021 shusuke. All rights reserved.
//

import UIKit

class ToastView: XibView {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initUI()
    }
}
// MARK: - Initialized Method
extension ToastView {
    func initUI() {
        // ラベルの設定
        self.label.text = "toast image"
        self.label.tintColor = .white
        // 画像の設定
        self.imageView.image = UIImage(named: "sample_image")
    }
}
