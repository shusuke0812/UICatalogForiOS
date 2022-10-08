//
//  ImageViewerViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/9/23.
//  Copyright © 2020 shusuke. All rights reserved.
//

/*
 * このクラスで実装されている主な機能
 *   - 画像をタップすると拡大表示する
 *   - （注）SceneDelegateを使うとライブラリが使えなくなる。UIApplication.swiftでクラッシュする。
 */

import UIKit
import ImageViewer

class ImageViewerViewController: UIViewController {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    let images: [String] = ["sample_image", "sample_image2", "sample_image3"]
    var galleryItem: GalleryItem!
    
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
        // ImageViewerを起動
        self.openImageViewer(indexPath: indexPath)
    }
}

extension ImageViewerViewController: GalleryItemsDataSource {
    /// imageをタップしたらImageViewerを立ち上げる処理
    @IBAction func didTapImage(_ sender: Any) {
        // 拡大表示する画像をセット
        guard let image = UIImage(named: images[0]) else { return }
        galleryItem = GalleryItem.image { $0(image) }
        // 拡大画像の画面へ遷移
        let galleryVC = GalleryViewController(startIndex: 0, itemsDataSource: self, configuration: [.deleteButtonMode(.none), .seeAllCloseButtonMode(.none), .thumbnailsButtonMode(.none)])
        self.present(galleryVC, animated: true, completion: nil)
    }
    /// collectionViewのimageをタップしたらImageViewerを立ち上げる処理
    func openImageViewer(indexPath: IndexPath) {
        // 拡大表示する画像をセット
        let displacedView = UIImage(named: images[indexPath.row])
        self.galleryItem = GalleryItem.image { $0(displacedView) }
        // 拡大画像の画面へ遷移
        let galleryVC = GalleryViewController(startIndex: indexPath.row, itemsDataSource: self, configuration: self.galleryConfiguration())
        self.present(galleryVC, animated: true, completion: nil)
    }
    func galleryConfiguration() -> GalleryConfiguration {
        return [
            .deleteButtonMode(.none),
            .seeAllCloseButtonMode(.none), .thumbnailsButtonMode(.none)
        ]
    }
    func itemCount() -> Int {
        return 1
    }
    func provideGalleryItem(_ index: Int) -> GalleryItem {
        return galleryItem
    }
}
