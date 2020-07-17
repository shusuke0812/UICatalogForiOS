//
//  ChangedInfoTabChildViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/6/28.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ChangedInfoTabChildViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func didTapChangeTab(_ sender: Any) {
        print("DEBUG: ボタンがタップされました")
        let parentVC = self.parent as! ChangedTabViewController
        parentVC.moveToViewController(at: 0)
    }
}


extension ChangedInfoTabChildViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "お知らせ")
    }
}
