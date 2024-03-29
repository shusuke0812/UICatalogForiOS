//
//  TableViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/7/3.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        self.initRefreshControl()
        super.viewDidLoad()
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row)"
        return cell
    }

    // TODO：リフレッシュが効かない（ライブラリによるtableViewのスクロールが原因）
    private func initRefreshControl() {
        let refresh: UIRefreshControl = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.refresh(sender:)), for: .valueChanged)
        self.tableView.refreshControl = refresh
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        self.tableView.reloadData()
        self.tableView.refreshControl?.endRefreshing()
    }
}
