//
//  FloatingButtonViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/7/12.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

protocol FloatingButtonViewControllerDelegate: class {
    // タブを切り替える
    func didTapChangeTab()
}

class FloatingButtonViewController: UIViewController {

    internal weak var delegate: FloatingButtonViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.delegate?.didTapChangeTab()
    }
    @IBAction func buttonTap(_ sender: Any) {
        print("DEBUG：　ボタンがタップされました")
        self.delegate?.didTapChangeTab()
    }
}
