//
//  ListViewModel.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/9/22.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

///　セクション
enum ListSectionType {
    /// UI
    case ui
    /// 写真
    case image
    /// インタラクション
    case interaction
    /// ネットワーク
    case networking
    
    internal var rows: [ListRowType] {
        switch self {
        case .ui:
            return [.mxparallax, .xlpager]
        case .image:
            return [.tocrop, .imageViewer, .imageViewerOnTableView]
        case .interaction:
            return [.hud, .toast]
        case .networking:
            return [.alamofire]
        }
    }
}

/// 各セクションのセル
enum ListRowType: String {
    case mxparallax             = "MXParallaxHeaderAndTabman"
    case xlpager                = "XLPagerTabStrip"
    case tocrop                 = "TOCropViewController"
    case imageViewer            = "ImageViewer"
    case imageViewerOnTableView = "ImageViewer(on TableView)"
    case hud                    = "PKHUD"
    case alamofire              = "Alamofire"
    case toast                  = "Toast"
}

class ListViewModel: NSObject {
    var sections: [ListSectionType] = []

    override init() {
        super.init()
        self.setSections()
    }
    
    private func listViewCellFactory(sectionType: ListSectionType, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ListViewCell {
        let cell: ListViewCell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath) as! ListViewCell
        let rowType: ListRowType = sectionType.rows[indexPath.row]
        cell.titleLabel.text = rowType.rawValue
        return cell
    }
}

extension ListViewModel {
    private func setSections() {
        self.sections = [.ui, .image, .interaction, .networking]
    }
}

extension ListViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].rows.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType: ListSectionType = self.sections[indexPath.section]
        return listViewCellFactory(sectionType: sectionType, tableView: tableView, cellForRowAt: indexPath)
    }
}
