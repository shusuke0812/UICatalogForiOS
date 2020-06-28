//
//  ChangedFavoriteTabChildViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/6/28.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ChangedFavoriteTabChildViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ChangedFavoriteTabChildViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "お気に入り")
    }
}
