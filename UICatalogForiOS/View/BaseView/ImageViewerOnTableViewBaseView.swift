//
//  ImageViewerOnTableViewBaseView.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/11/5.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

/// TableViewType
enum TableViewTag: Int {
    case normal             = 0
    case withCollectionView = 1
}

class ImageViewerOnTableViewBaseView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewWithCollectionView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setTableView()
    }
}
// MARK: - Initialized Method
extension ImageViewerOnTableViewBaseView {
    private func setTableView() {
        self.tableView.tag = TableViewTag.normal.rawValue
        self.tableViewWithCollectionView.tag = TableViewTag.withCollectionView.rawValue
    }
}
