//
//  TrendingsViewController.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 13/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//
import UIKit

class TrendingsViewController: UIViewController {
    let collectionViewAIdentifier = "TrendingsCollectionViewCell"
    let collectionViewBIdentifier = "TagsCollectionViewCell"
    let imageName: [String] = ["organic", "crueltyfree", "hypoalergenic", "oilfree"]
    let labelName: [String] = ["Organic", "Cruelty free", "Hypoalergenic", "Oil free"]
    let numberTag: [Int] = [1, 4, 0, 3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    lazy var viewTrendigs: TrendingsView = {
        let view = TrendingsView(frame: self.view.frame)
        return view
    }()
    
    func setupUI() {
        view.addSubview(viewTrendigs)
        setupSeachController(title: "Trendings")
        setDelegates()
    }
    
    // delegates
    func setDelegates() {
        self.viewTrendigs.trendingsCollectionView.delegate = self
        self.viewTrendigs.trendingsCollectionView.dataSource = self
        
        self.viewTrendigs.tagsCollectionView.delegate = self
        self.viewTrendigs.tagsCollectionView.dataSource = self
    }
    
    // Navigation controller.
    func setupSeachController(title: String, largeTitle: Bool = true) {
        self.title = title
        self.navigationController?.navigationBar.prefersLargeTitles = largeTitle
    }
}

extension TrendingsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.viewTrendigs.trendingsCollectionView {
            return 4
        } else { return 4}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.viewTrendigs.trendingsCollectionView {
            guard let cell = self.viewTrendigs.trendingsCollectionView.dequeueReusableCell(withReuseIdentifier: collectionViewAIdentifier, for: indexPath) as? TrendingsCollectionViewCell else { return TrendingsCollectionViewCell() }
            return cell
            
        } else {
            guard let cell = self.viewTrendigs.tagsCollectionView.dequeueReusableCell(withReuseIdentifier: collectionViewBIdentifier, for: indexPath) as? TagsCollectionViewCell else { return TagsCollectionViewCell() }
            cell.imageView.image = UIImage(named: imageName[indexPath.row])
            cell.labelTag.text = labelName[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destination = DescriptionTagsViewController()
        destination.tag = tags[numberTag[indexPath.row]]
        navigationController?.pushViewController(destination, animated: true)
    }
}
