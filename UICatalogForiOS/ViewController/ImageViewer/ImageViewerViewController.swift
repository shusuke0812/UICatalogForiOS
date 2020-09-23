//
//  ImageViewerViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/9/23.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    private let images: [String] = ["sample_image", "sample_image2", "sample_image3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageCollectionView.delegate = self
        self.imageCollectionView.dataSource = self
    }
    
}

extension ImageViewerViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    // 写真セル数を設定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    // 写真セル内容を設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionCell", for: indexPath)
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let cellImage = UIImage(named: images[indexPath.row])
        imageView.image = cellImage
        return cell
    }
    // 写真が選択された時の処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("「\(images[indexPath.row])」が選択されました")
    }
}
