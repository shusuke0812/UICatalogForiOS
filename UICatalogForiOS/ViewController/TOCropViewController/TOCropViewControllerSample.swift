//
//  TOCropViewController.swift
//  UICatalogForiOS
//
//  Created by Shusuke Ota on 2020/9/12.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit
import CropViewController

class TOCropViewControllerSample: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    @IBAction func tapImageView(_ sender: Any) {
        self.setImagePicker()
    }
}

extension TOCropViewControllerSample {
    func setUI() {
        self.imageView.clipsToBounds = true
        self.imageView.layer.cornerRadius = self.imageView.frame.width / 2
    }
}

extension TOCropViewControllerSample: UIImagePickerControllerDelegate, UINavigationControllerDelegate, CropViewControllerDelegate {
    func setImagePicker() {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let originalImage: UIImage = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage) else { return }
        
        let cropVC = CropViewController(croppingStyle: .circular, image: originalImage)
        cropVC.delegate = self
        picker.dismiss(animated: true, completion: {
            self.present(cropVC, animated: true, completion: nil)
        })
    }
    
    func cropViewController(_ cropViewController: CropViewController, didCropToCircularImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        self.imageView.image = image
        cropViewController.dismiss(animated: false, completion: nil)
    }
}
