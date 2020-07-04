//
//  HeaderViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/7/4.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit
import MXParallaxHeader

class HeaderViewController: UIViewController {
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parallaxHeader?.delegate = self
      
    }

}

extension HeaderViewController: MXParallaxHeaderDelegate {
    func parallaxHeaderDidScroll(_ parallaxHeader: MXParallaxHeader) {
        let alpha = 1 - min(1, parallaxHeader.progress)
        visualEffectView.alpha = alpha
    }
}
