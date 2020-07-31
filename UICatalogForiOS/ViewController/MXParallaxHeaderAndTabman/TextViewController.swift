//
//  TextViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/8/1.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    
    @IBOutlet weak var getValueLabel: UILabel!
    var getPreviousPageValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getValueLabel.text = getPreviousPageValue
    }
}
