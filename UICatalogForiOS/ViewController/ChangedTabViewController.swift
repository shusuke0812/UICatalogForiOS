//
//  ChangedTabViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/6/28.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ChangedTabViewController: ButtonBarPagerTabStripViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        tabVarSetting()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // ナビゲーションバーを隠す処理
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillLayoutSubviews() {
        // タブバーに下線を追加
        let underLine = CALayer()
        underLine.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width * 2, height: 1.0)
        underLine.backgroundColor = UIColor.lightGray.cgColor
        scrollView.layer.addSublayer(underLine)
    }
    
    // ButtonBarPagerの設定
    func tabVarSetting() {
        // 色・文字サイズ・タブバーの設定
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 17)
        settings.style.selectedBarBackgroundColor = .baseColor
        settings.style.selectedBarHeight = 2.0
               
        // 余白の設定
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        settings.style.buttonBarMinimumInteritemSpacing = 16
        settings.style.buttonBarItemLeftRightMargin = 32
        changeCurrentIndexProgressive = { oldCell, newCell, progressPercentage, changeCurrentIndex, animated in
            guard changeCurrentIndex, let oldCell = oldCell, let newCell = newCell else { return }
                   
            oldCell.contentView.backgroundColor = .white
            oldCell.label.textColor = .lightGray
            newCell.contentView.backgroundColor = .white
            newCell.label.textColor = .baseColor
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let notificationOfDirectSalesChildVC = UIStoryboard(name: "ChangedFavoriteTabChildViewController", bundle: nil).instantiateInitialViewController()!
        let notificationOfAdminChildVC = UIStoryboard(name: "ChangedInfoTabChildViewController", bundle: nil).instantiateInitialViewController()!
        
        return [notificationOfDirectSalesChildVC, notificationOfAdminChildVC]
    }

}

extension UIColor {
    class var baseColor: UIColor {
        return UIColor(named: "baseColor")!
    }
}
