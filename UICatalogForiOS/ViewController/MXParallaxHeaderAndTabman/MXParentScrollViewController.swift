//
//  MXParentScrollViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/8/1.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit
import MXParallaxHeader


// ライブラリを拡張するクラス
class MXParentScrollViewController: MXScrollViewController {
    
    public var getValue: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("DEBUG: 拡張MXScrollVCのメソッドが呼ばれました")
        if (segue.identifier == "Header") {
            let vc: HeaderViewController = (segue.destination as? HeaderViewController)!
            vc.getPreviousPageValue = getValue
        }
        
        if (segue.identifier == "Contents") {
            let vc: PagingMenuViewController = (segue.destination as? PagingMenuViewController)!
        
        }
    }
}
