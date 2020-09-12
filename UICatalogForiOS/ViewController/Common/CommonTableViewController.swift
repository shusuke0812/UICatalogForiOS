//
//  CommonTableViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/7/31.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit
import MXParallaxHeader

class CommonTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.initRefreshControl()
        super.viewDidLoad()
    }
    
    @IBAction func tapButton(_ sender: Any) {
        let s = UIStoryboard(name: "TOCropViewControllerSample", bundle: nil)
        let vc = s.instantiateInitialViewController() as! TOCropViewControllerSample
        self.present(vc, animated: true, completion: nil)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row)"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // AccordionMenuViewControllerへテーブルのindexを渡して画面遷移先でindexを表示させる
        #if false
        let s: UIStoryboard = UIStoryboard(name: "AccordionMenuViewController", bundle: nil)
        let vc: AccordionMenuViewController = s.instantiateInitialViewController() as! AccordionMenuViewController
        
        vc.getPreviousPageValue = "\(indexPath.row)"
        #endif
        
        // MXScrollViewControllerのヘッダへテーブルのindexを渡して画面遷移先でindexを表示させる
        #if true
        let s: UIStoryboard = UIStoryboard(name: "TwitterScrollViewController", bundle: nil)
        let vc: MXParentScrollViewController = s.instantiateInitialViewController() as! MXParentScrollViewController
        vc.getValue = "table index is \(indexPath.row)"
        self.present(vc, animated: true, completion: nil)
        #endif
        
        // tableView + modalView + refreshControlのテスト用
        /* この実装だと遷移先ではrefreshControllが効いてしまいモーダルビューを下スワイプで閉じることができない */
        #if false
        let s: UIStoryboard = UIStoryboard(name: "CommonTableViewController", bundle: nil)
        let vc: CommonTableViewController = s.instantiateInitialViewController() as! CommonTableViewController
        present(vc, animated: true, completion: nil)
        #endif
    }
    
    private func initRefreshControl() {
        let refresh: UIRefreshControl = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.refresh(sender:)), for: .valueChanged)
        self.tableView.refreshControl = refresh
    }
    
    @objc private func refresh(sender: UIRefreshControl) {
        print("DEBUG： リフレッシュ機能が起動しました")
        self.tableView.reloadData()
        self.tableView.refreshControl?.endRefreshing()
    }
}
