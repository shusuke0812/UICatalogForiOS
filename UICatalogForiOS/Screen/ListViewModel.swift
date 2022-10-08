//
//  ListViewModel.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/9/22.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

///　セクション
enum ListSection {
    case ui
    case image
    case interaction
    case networking
    
    internal var rows: [ListRow] {
        switch self {
        case .ui:
            return [.mxparallax, .xlpager]
        case .image:
            return [.tocrop, .imageViewer, .imageViewerOnTableView]
        case .interaction:
            return [.hud, .toast]
        case .networking:
            return [.alamofire, .hydra]
        }
    }
}

/// 各セクションのセル
enum ListRow: String {
    case mxparallax             = "MXParallaxHeaderAndTabman"
    case xlpager                = "XLPagerTabStrip"
    case tocrop                 = "TOCropViewController"
    case imageViewer            = "ImageViewer"
    case imageViewerOnTableView = "ImageViewer(on TableView)"
    case hud                    = "PKHUD"
    case alamofire              = "Alamofire"
    case hydra                  = "Hydra"
    case toast                  = "Toast"
}

class ListViewModel: NSObject {
    var sections: [ListSection] = []

    override init() {
        super.init()
        self.setSections()
    }
    
    private func listViewCellFactory(section: ListSection, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ListViewCell {
        let cell: ListViewCell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath) as! ListViewCell
        let row: ListRow = section.rows[indexPath.row]
        cell.titleLabel.text = row.rawValue
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
        let _section: ListSection = self.sections[indexPath.section]
        return listViewCellFactory(section: _section, tableView: tableView, cellForRowAt: indexPath)
    }
}
