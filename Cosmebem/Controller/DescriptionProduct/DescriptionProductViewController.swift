//
//  DescriptionProductViewController.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 21/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class DescriptionProductViewController: UIViewController {
    var descriptionProduct = [Product]()
    private var colors: [UIColor] = []
    
    fileprivate lazy var viewDescriptionProduct: DescriptionProductView =  {
        let view = DescriptionProductView(frame: self.view.frame)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(viewDescriptionProduct)
        hexToUIColor()
        setDelegatesCollectionView()
        configureView()
    }
    
    func setDelegatesCollectionView() {
        viewDescriptionProduct.collectionView.delegate = self
        viewDescriptionProduct.collectionView.dataSource = self
    }
    
    private func hexToUIColor() {
        for color in descriptionProduct[0].productColors {
            colors.append(UIColor(hex: color.hexValue!)!)
        }
        
        if colors.isEmpty {
            viewDescriptionProduct.colorLabel.isHidden = true
            viewDescriptionProduct.collectionView.isHidden = true
        }
    }
    
    private func configureView() {
        viewDescriptionProduct.imageView.downloaded(from: "https:" + descriptionProduct[0].apiFeaturedImage!)
        viewDescriptionProduct.titleLabel.text = descriptionProduct[0].name!
        
        let textD = descriptionProduct[0].productDescription!
        viewDescriptionProduct.textDescription.text = textD.count > 547 ? String(textD.prefix(547)) : textD
        
        viewDescriptionProduct.brandLabel.text = descriptionProduct[0].brand!

    }
}

extension DescriptionProductViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
