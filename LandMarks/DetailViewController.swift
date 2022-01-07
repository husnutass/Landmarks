//
//  DetailViewController.swift
//  LandMarks
//
//  Created by Hüsnü Taş on 7.01.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedName: String?
    var selectedImage: UIImage?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = selectedImage
        detailLabel.text = selectedName
    }

}
