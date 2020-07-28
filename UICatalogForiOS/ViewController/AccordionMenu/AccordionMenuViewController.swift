//
//  AccordionMenuViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/7/28.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class AccordionMenuViewController: UIViewController {

    var showSaleTimeDetail = true
    
    @IBOutlet weak var saleTimeDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension AccordionMenuViewController {
    @IBAction func showSaleTimeDetailButton(_ sender: Any) {
        showSaleTimeDetail = !showSaleTimeDetail
        UIView.animate(withDuration: 0.3) {
            self.saleTimeDetail.isHidden = !self.showSaleTimeDetail
        }
    }
}
