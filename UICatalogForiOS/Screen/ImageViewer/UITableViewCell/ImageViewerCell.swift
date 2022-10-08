//
//  ImageViewerCell.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/11/5.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class ImageViewerCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var centerImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUI()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
// MARK: - Initialized Method
extension ImageViewerCell {
    private func setUI() {
        self.titleLabel.text = "画像をタップすると拡大"
        self.leftImageView.image = UIImage(named: "sample_image")
        self.centerImageView.image = UIImage(named: "sample_image2")
        self.rightImageView.image = UIImage(named: "sample_image3")
    }
}
