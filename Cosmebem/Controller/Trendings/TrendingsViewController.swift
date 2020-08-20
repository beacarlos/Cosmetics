//
//  TrendingsViewController.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 13/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class TrendingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        callAPI()
    }
    
    let productTags: [String] = ["Hypoallergenic", "Vegan", "alcohol+free", "Dairy+Free", "oil+free", "cruelty+free", "Non-GMO", "No+Talc"]

    func callAPI() {
//        Service.shared.findProductByBrand(with: "maybelline", completion: { product in
//            guard let product = product else { return }
//            print(product)
//        })
        
//        Service.shared.findProductByCategory(productCategory: "powder", productType: "") { product in
//            guard let product = product else { return }
//            print(product.count)
//        }
        
//        Service.shared.findProductByType(productType: "blush") { product in
//            guard let product = product else { return }
//            print(product.count)
//        }
        
//        Service.shared.findProductByTag(productTags: "Non-GMO") { product in
//            guard let product = product else { return }
//            print(product)
//        }
    }
    
    func setupUI() {
        // search controller
        self.view.addSubview(TrendingsView(frame: view.frame))
        setupSeachController(title: "Trendings")
        
        // collection view trendings.
        self.view.addSubview(headerTrendingsCollectionView)
        self.view.addSubview(trendingsCollectionView)
        self.view.addSubview(topTagsLabel)
        self.view.addSubview(stackTopTags)
        
        stackTopTags.addArrangedSubview(veganButton)
        stackTopTags.addArrangedSubview(crueltyFreeButton)
        stackTopTags.addArrangedSubview(hypoallergenicButton)
        stackTopTags.addArrangedSubview(oilFreeButton)
        
        // constraints collection view trendings.
        contraintsTrandingsCollectionView()
    }
    
    // Search controller.
    func setupSeachController(title: String, largeTitle: Bool = true) {
        let searchController = UISearchController(searchResultsController: nil)
        self.title = title
        self.navigationController?.navigationBar.prefersLargeTitles = largeTitle
        navigationItem.searchController = searchController
    }
    
    lazy var headerTrendingsCollectionView: UILabel = {
        let label = UILabel()
        label.text = "Trending this week"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
        return label
    }()
    
    // Collection view trendings.
    lazy var trendingsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        // delegates
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // register collection view cell
        collectionView.register(TrendingsCollectionViewCell.self, forCellWithReuseIdentifier: "TrendingsCollectionViewCell")
        return collectionView
    }()
    
    // Top tags label.
    lazy var topTagsLabel: UILabel = {
        let label = UILabel()
        label.text = "Top Label"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
        return label
    }()
    
    // Stack top tags.
    lazy var stackTopTags: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var veganButton: TagsButton = {
        let button = TagsButton(image: UIImage(named: "organic"))
        return button
    }()
    
    lazy var crueltyFreeButton: TagsButton = {
        let button = TagsButton(image: UIImage(named: "crueltyfree"))
        return button
    }()
    
    lazy var hypoallergenicButton: TagsButton = {
        let button = TagsButton(image: UIImage(named: "hypoalergenic"))
        return button
    }()
    
    lazy var oilFreeButton: TagsButton = {
        let button = TagsButton(image: UIImage(named: "oilfree"))
        //addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        return button
    }()
    
    // Layout collection view trendings.
    func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 40)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 15
        layout.itemSize = CGSize(width: 325, height: 227)
        
        return layout
    }
    
    func contraintsTrandingsCollectionView() {
        // Label.
        NSLayoutConstraint.activate([
            headerTrendingsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            headerTrendingsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerTrendingsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            headerTrendingsCollectionView.bottomAnchor.constraint(equalTo: trendingsCollectionView.topAnchor)
        ])
        
        // Collection view trendings.
        NSLayoutConstraint.activate([
            trendingsCollectionView.topAnchor.constraint(equalTo: headerTrendingsCollectionView.bottomAnchor),
            trendingsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trendingsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            trendingsCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
        
        // Top Tags Label.
        NSLayoutConstraint.activate([
            topTagsLabel.topAnchor.constraint(equalTo: trendingsCollectionView.bottomAnchor, constant: 20),
            topTagsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topTagsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Top tags stack view.
        NSLayoutConstraint.activate([
            stackTopTags.topAnchor.constraint(equalTo: topTagsLabel.bottomAnchor, constant: 20),
            stackTopTags.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackTopTags.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackTopTags.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
}

extension TrendingsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        cell.titleLabel.text = titles[indexPath.item]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingsCollectionViewCell", for: indexPath) as? TrendingsCollectionViewCell else { return TrendingsCollectionViewCell() }
        return cell
    }
}