//
//  LoadIndicatorManager.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2021/9/20.
//  Copyright © 2021 shusuke. All rights reserved.
//

import UIKit

class LoadIndicatorManager {
    
    private let indicator: UIActivityIndicatorView
    // シングルトン
    static var shared = LoadIndicatorManager()
    private init() {
        self.indicator = UIActivityIndicatorView()
    }
    
    func startAnimation(vc: UIViewController) {
        indicator.center = vc.view.center
        indicator.style = .medium
        vc.view.addSubview(indicator)
        
        indicator.startAnimating()
    }
    func stopAnimation(vc: UIViewController) {
        indicator.stopAnimating()
        indicator.removeFromSuperview()
    }
}
