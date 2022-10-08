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
    
    var getValue: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Header") {
            let vc1: HeaderViewController = (segue.destination as? HeaderViewController)!
            vc1.getPreviousPageValue = getValue
        }
        
        if (segue.identifier == "Contents") {
            let vc2: PagingMenuViewController = (segue.destination as? PagingMenuViewController)!
            vc2.getPreviousPageValue = getValue
            
        }
    }
}
