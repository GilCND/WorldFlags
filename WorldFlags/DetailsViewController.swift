//
//  DetailsViewController.swift
//  WorldFlags
//
//  Created by Felipe Gil on 2021-06-02.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imgFlag: UIImageView!
    var nameOfImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = nameOfImage {
            imgFlag.image = UIImage (named: imageToLoad)
        }
        imgFlag.layer.borderWidth = 1
        imgFlag.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    @objc func shareTapped() {
        
        guard let image = imgFlag.image?.jpegData(compressionQuality: 0.8), let imageName = nameOfImage else {
            print ("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present (vc, animated: true)
    }
}
