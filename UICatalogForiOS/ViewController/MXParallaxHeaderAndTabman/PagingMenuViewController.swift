//
//  PagingMenuViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/7/3.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class PagingMenuViewController: TabmanViewController {
    
    private lazy var viewControllers: [UIViewController] = {
        [
            storyboard!.instantiateViewController(withIdentifier: "TextViewController"),
            storyboard!.instantiateViewController(withIdentifier: "TableViewController")
        ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        // ページングメニューに表示する項目
        bar.items = [
            Item(title: "Text View"),
            Item(title: "Table View")
        ]
    }
}

extension PagingMenuViewController: PageboyViewControllerDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
