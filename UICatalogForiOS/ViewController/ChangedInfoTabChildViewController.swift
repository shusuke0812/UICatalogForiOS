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
}

extension ChangedInfoTabChildViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "お知らせ")
    }
}
