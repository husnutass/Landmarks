//
//  ViewController.swift
//  LandMarks
//
//  Created by Hüsnü Taş on 7.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var landmarks = [String]()
    private var images = [UIImage?]()
    private var selectedName: String?
    private var selectedImage: UIImage?
    private let detailSegueIdentifier = "toDetailViewController"
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Landmarks"
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        landmarks = ["Eiffel Tower", "Pisa Tower", "Empire State Building"]
        images = [UIImage(named: "eiffel"), UIImage(named: "pisa"), UIImage(named: "empire")]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailSegueIdentifier {
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.selectedImage = selectedImage
            detailViewController.selectedName = selectedName
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return landmarks.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: LandmarkCollectionViewCell.identifier, for: indexPath) as! LandmarkCollectionViewCell
        cell.setData(with: landmarks[indexPath.row])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedName = landmarks[indexPath.row]
        selectedImage = images[indexPath.row]
        performSegue(withIdentifier: detailSegueIdentifier, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size: CGFloat = mainCollectionView.frame.size.width
        return CGSize(width: size, height: CGFloat(60))
    }
    
}

