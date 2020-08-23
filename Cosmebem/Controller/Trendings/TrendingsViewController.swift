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
    var result = [Product]() {
        didSet {
            DispatchQueue.main.async {
                self.viewTrendigs.trendingsCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    lazy var viewTrendigs: TrendingsView = {
        let view = TrendingsView(frame: self.view.frame)
        return view
    }()
    
    func callAPI() {
        let idProducts: [String] = ["998", "1043", "604", "814"]
        for idP in idProducts {
            Service.shared.findProductByID(id: idP) { (product) in
                guard let product = product else { return }
                self.result.append(product)
            }
        }
    }
    
    func setupUI() {
        callAPI()
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
            return result.count
        } else { return 4}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.viewTrendigs.trendingsCollectionView {
            guard let cell = self.viewTrendigs.trendingsCollectionView.dequeueReusableCell(withReuseIdentifier: collectionViewAIdentifier, for: indexPath) as? TrendingsCollectionViewCell else { return TrendingsCollectionViewCell() }
            cell.cosmeticImage.downloaded(from: "https:"+result[indexPath.row].apiFeaturedImage!)
            cell.brandLabel.text = result[indexPath.row].brand!
            cell.categorieLabel.text = result[indexPath.row].productType!
            cell.cosmeticLabel.text = result[indexPath.row].name!
            cell.tagsStackView.isHidden = true
            if result[indexPath.row].tagList.first ?? "Ntem" == "Ntem" {
                cell.tagsStackView.isHidden = true
            }
            return cell
            
        } else {
            guard let cell = self.viewTrendigs.tagsCollectionView.dequeueReusableCell(withReuseIdentifier: collectionViewBIdentifier, for: indexPath) as? TagsCollectionViewCell else { return TagsCollectionViewCell() }
            cell.imageView.image = UIImage(named: imageName[indexPath.row])
            cell.labelTag.text = labelName[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.viewTrendigs.trendingsCollectionView {
            let destination = DescriptionProductViewController()
            let description = result[indexPath.row]
            destination.descriptionProduct = [description]
            present(destination, animated: true, completion: nil)
        } else {
            let destination = DescriptionTagsViewController()
            destination.tag = tags[numberTag[indexPath.row]]
            navigationController?.pushViewController(destination, animated: true)
        }
    }
}
