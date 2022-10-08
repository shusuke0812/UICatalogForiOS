//
//  AlamofireTableViewCell.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2021/1/16.
//  Copyright © 2021 shusuke. All rights reserved.
//

import UIKit

class AlamofireTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    
    static func initiate() -> UINib {
        UINib(nibName: AlamofireTableViewCell.reuseIdentifier, bundle: nil)
    }
    static let reuseIdentifier = "AlamofireTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Setting
extension AlamofireTableViewCell {
    func configLabel(title: String, star: Int) {
        self.titleLabel.text = title
        self.starLabel.text = "star: " + "\(star)"
    }
}
