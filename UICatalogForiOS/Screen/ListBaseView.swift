//
//  ListBaseView.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/9/22.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class ListBaseView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerTableViewCell()
    }
}

extension ListBaseView {
    private func registerTableViewCell() {
        let nib = UINib(nibName: "ListViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ListViewCell")
    }
}
