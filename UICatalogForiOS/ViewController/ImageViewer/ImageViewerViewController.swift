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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageCollectionView.dataSource = self
    }
    
}

extension ImageViewerViewController: UICollectionViewDataSource {
    // 写真セル数を設定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    // 写真セル内容を設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionCell", for: indexPath)
        return cell
    }
}
