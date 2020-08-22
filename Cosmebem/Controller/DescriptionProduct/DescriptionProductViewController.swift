//
//  DescriptionProductViewController.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 21/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class DescriptionProductViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var descriptionProduct = [Product]()
    var colors: [UIColor] = []
    
    lazy var viewB: DescriptionProductView =  {
        let view = DescriptionProductView(frame: self.view.frame)
        view.imageView.downloaded(from: "https:" + descriptionProduct[0].apiFeaturedImage!)
        view.titleLabel.text = descriptionProduct[0].name!
        let textD = descriptionProduct[0].productDescription!
        view.textDescription.text = textD.count > 547 ? String(textD.prefix(547)) : textD
        view.brandLabel.text = descriptionProduct[0].brand!
        return view
    }()
    
    func hexToUIColor() {
        for color in descriptionProduct[0].productColors {
            colors.append(UIColor(hex: color.hexValue!)!)
        }
        
        if colors.isEmpty {
            viewB.colorLabel.isHidden = true
            viewB.collectionView.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(viewB)
        hexToUIColor()
        //collectio view
        viewB.collectionView.delegate = self
        viewB.collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorsCollectionViewCell", for: indexPath) as? ColorsCollectionViewCell else { return ColorsCollectionViewCell() }
        cell.titleLabel.text = ""
        cell.roundedBackgroundView.backgroundColor = colors[indexPath.row]
        return cell
    }
}
