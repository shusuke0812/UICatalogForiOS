//
//  PkhudViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/9/25.
//  Copyright © 2020 shusuke. All rights reserved.
//

/*
 * このクラスで実装されている主な機能
 *   - ボタンをタップするとロード中であるHUDが表示され、指定時間後に閉じる機能
 */

import UIKit
import PKHUD

class PkhudViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Action Method
    @IBAction func startHudButton(_ sender: Any) {
        #if false
        // HUD表示
        HUD.show(.progress)
        // 指定時間後にHUDを閉じる
        HUD.flash(.progress, delay: 5) { _ in
            // do nothing
        }
        #endif
        
        #if true
        // HUD表示
        HUD.show(.progress)
        // 5秒後の遅延処理
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            // HUDを閉じる
            HUD.hide() { _ in
                // do nothing
            }
        }
        #endif
    }
}
