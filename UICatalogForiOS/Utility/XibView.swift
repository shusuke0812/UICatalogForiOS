//
//  XibView.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2021/1/16.
//  Copyright © 2021 shusuke. All rights reserved.
//

import UIKit

class XibView: UIView {
    // Viewを作成する時に呼ばれる
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadView()
    }
    // StoryboardやXibから作成された時に呼ばれる
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadView()
    }
}
extension XibView {
    private func loadView() {
        // 自身と同じclass名のxibを読み込む
        let className = String(describing: type(of: self))
        let view: UIView = Bundle.main.loadNibNamed(className, owner: self, options: nil)?.first as! UIView
        view.backgroundColor = .clear
        view.frame = self.bounds
        self.addSubview(view)
    }
}
