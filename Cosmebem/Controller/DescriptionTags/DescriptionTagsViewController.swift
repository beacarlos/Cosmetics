//
//  DescriptionTagsViewController.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 18/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class DescriptionTagsViewController: UIViewController {
    var tag: Tag = Tag(name: "", description: "", image: UIImage(named: "hi"), endpoint: "")
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(DescriptionTagCollectionViewCell.self, forCellWithReuseIdentifier: "DescriptionTagCollectionViewCell")
        collectionView.backgroundColor = .none
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var descriptionView: DescriptionTagsView = {
        let view = DescriptionTagsView(frame: self.view.frame)
        view.textDescription.text = tag.description
        return view
    }()
    
    var result = [Product]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func callAPI() {
        Service.shared.findProductByTag(productTags: tag.endpoint) { (produtByTag) in
            guard let produts = produtByTag else { return }
            for product in produts {
                self.result.append(product)
            }
        }
    }
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 100, height: 120)
        
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(descriptionView)
        view.addSubview(collectionView)
        view.backgroundColor = UIColor(red: 0.98, green: 0.94, blue: 0.93, alpha: 1.00)
        setupSeachController(title: tag.name)
        
        callAPI()
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 6.8/10),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            
        ])
    }
    
    func setupSeachController(title: String, largeTitle: Bool = true) {
        self.title = title
//        self.navigationController?.navigationBar.prefersLargeTitles = largeTitle
        navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.94, green: 0.80, blue: 0.80, alpha: 1.00)
        
    }
}

extension DescriptionTagsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionTagCollectionViewCell", for: indexPath) as? DescriptionTagCollectionViewCell else { return DescriptionTagCollectionViewCell() }
        cell.imageView.downloaded(from: "https:"+result[indexPath.row].apiFeaturedImage!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destination = DescriptionProductViewController()
        let description = result[indexPath.row]
        destination.descriptionProduct = [description]
        present(destination, animated: true, completion: nil)
    }
}
