//
//  UIAlertController+Extension.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2021/9/22.
//  Copyright © 2021 shusuke. All rights reserved.
//

import UIKit

extension UIAlertController {
    static func showAlert(style: UIAlertController.Style, vc: UIViewController, title: String?, message: String?, okBtnTitle: String, cancelBtnTitle: String?, completionOk: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        if let cancelBtnTitle = cancelBtnTitle {
            let cancelAction = UIAlertAction(title: cancelBtnTitle, style: .cancel) { _ -> Void in
            }
            alert.addAction(cancelAction)
        }
        let okAction = UIAlertAction(title: okBtnTitle, style: .default) { _ -> Void in
            if let completionOk = completionOk {
                completionOk()
            }
        }
        alert.addAction(okAction)
        vc.present(alert, animated: true, completion: nil)
    }
}
