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
        let s: UIStoryboard = UIStoryboard(name: "TwitterScrollViewController", bundle: nil)
        let vc: UIViewController = s.instantiateInitialViewController() as! MXScrollViewController
        self.present(vc, animated: true, completion: nil)
    }
}
