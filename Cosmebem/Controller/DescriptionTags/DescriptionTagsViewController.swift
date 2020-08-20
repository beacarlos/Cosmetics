//
//  DescriptionTagsViewController.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 18/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class DescriptionTagsViewController: UIViewController {
    var tag: String = ""
    
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
        return view
    }()
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 0)
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
        setupSeachController(title: tag)
        
        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: self.descriptionView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 4.5/10),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            
        ])
    }
    
    func setupSeachController(title: String, largeTitle: Bool = true) {
        self.title = title
        self.navigationController?.navigationBar.prefersLargeTitles = largeTitle
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.94, green: 0.80, blue: 0.80, alpha: 1.00)
    }
}

extension DescriptionTagsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionTagCollectionViewCell", for: indexPath) as? DescriptionTagCollectionViewCell else { return DescriptionTagCollectionViewCell() }
        return cell
    }
}
