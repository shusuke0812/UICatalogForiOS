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

    override func viewDidLoad() {
        super.viewDidLoad()
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
        /*
        let s: UIStoryboard = UIStoryboard(name: "AccordionMenuViewController", bundle: nil)
        let vc: AccordionMenuViewController = s.instantiateInitialViewController() as! AccordionMenuViewController
        
        vc.getPreviousPageValue = "\(indexPath.row)"
        */
        
        // MXScrollViewControllerのヘッダへテーブルのindexを渡して画面遷移先でindexを表示させる
        let s: UIStoryboard = UIStoryboard(name: "TwitterScrollViewController", bundle: nil)
        let vc: MXParentScrollViewController = s.instantiateInitialViewController() as! MXParentScrollViewController
        
        vc.getValue = "table index is \(indexPath.row)"
        
        self.present(vc, animated: true, completion: nil)
    }
}
