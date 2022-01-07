//
//  LandmarkCollectionViewCell.swift
//  LandMarks
//
//  Created by Hüsnü Taş on 7.01.2022.
//

import UIKit

class LandmarkCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "landmarkCell"
    
    @IBOutlet weak var cellLabel: UILabel!
    
    func setData(with name: String) {
        cellLabel.text = name
    }
    
}
