//
//  TableViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/7/3.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var tableView: UITableView!
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row)"
        return cell
    }

}
