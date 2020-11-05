//
//  ImageViewerOnTableViewModel.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/11/5.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class ImageViewerOnTableViewModel: NSObject {
}

// MARK: - TableView DataSource Method
extension ImageViewerOnTableViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("")
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = self.checkTableViewKind(tableView)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        return cell
    }
}
extension ImageViewerOnTableViewModel {
    func checkTableViewKind(_ tableView: UITableView) -> String {
        var cellIdentifier: String
        switch tableView.tag {
        case TableViewTag.normal.rawValue:
            cellIdentifier = Static.CellId.normal
            return cellIdentifier
        case TableViewTag.withCollectionView.rawValue:
            cellIdentifier = Static.CellId.withCollectionView
            return cellIdentifier
        default:
            return ""
        }
    }
}
