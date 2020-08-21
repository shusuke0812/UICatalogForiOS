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
    
    // アコーディオン
    @IBOutlet weak var saleTimeDetail: UILabel!
    @IBOutlet weak var getValue: UILabel!
    var getPreviousPageValue: String?
    
    // もっと見る
    @IBOutlet weak var heightView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getValue.text = getPreviousPageValue
    }
    @IBAction func moreReadButton(_ sender: Any) {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            self.heightView.isHidden.toggle()
        }
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
