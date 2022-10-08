//
//  ImageViewerCollectionViewCell.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/11/5.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class ImageViewerCollectionViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUI()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
// MARK: - Initialized Method
extension ImageViewerCollectionViewCell {
    private func setUI() {
        self.titleLabel.text = "画像をタップすると拡大"
    }
}
