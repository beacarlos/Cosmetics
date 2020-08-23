//
//  Trendings.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 13/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class TrendingsView: UIView {
    lazy var viewStatusBar: UIView = {
        let viewStatusBar = UIView()
        viewStatusBar.backgroundColor = UIColor(red: 0.94, green: 0.80, blue: 0.80, alpha: 1.00)
        viewStatusBar.translatesAutoresizingMaskIntoConstraints = false
        return viewStatusBar
    }()
    
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
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout(itemSize: CGSize(width: 325, height: 227)))
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        // register collection view cell
        collectionView.register(TrendingsCollectionViewCell.self, forCellWithReuseIdentifier: "TrendingsCollectionViewCell")
        return collectionView
    }()
    
    lazy var labelName: UILabel = {
        let label = UILabel()
        label.text = "Tags"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
        return label
    }()
    
    // Collection view trendings.
    lazy var tagsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayoutTags(itemSize: CGSize(width: 94, height: 150)))
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(TagsCollectionViewCell.self, forCellWithReuseIdentifier: "TagsCollectionViewCell")
        return collectionView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(viewStatusBar)
        addSubview(headerTrendingsCollectionView)
        addSubview(trendingsCollectionView)
        addSubview(labelName)
        addSubview(tagsCollectionView)
        contraintsTrandingsCollectionView()
        viewBackgroundSearchBar(view: viewStatusBar, constant: 170)
    }
}

extension TrendingsView {
    // Layout collection view trendings.
    func collectionViewLayout(itemSize: CGSize) -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 40)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 15
        layout.itemSize = itemSize
        
        return layout
    }
    
    // Layout collection view trendings.
    func collectionViewLayoutTags(itemSize: CGSize) -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = itemSize
        
        return layout
    }
    
    func contraintsTrandingsCollectionView() {
        // Label.
        NSLayoutConstraint.activate([
            headerTrendingsCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            headerTrendingsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            headerTrendingsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16),
            headerTrendingsCollectionView.bottomAnchor.constraint(equalTo: self.trendingsCollectionView.topAnchor)
        ])
        
        // Collection view trendings.
        NSLayoutConstraint.activate([
            trendingsCollectionView.topAnchor.constraint(equalTo: self.headerTrendingsCollectionView.bottomAnchor),
            trendingsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            trendingsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            trendingsCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
        ])
        
        // Collection view tags.
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: self.trendingsCollectionView.bottomAnchor, constant: 30),
            labelName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        
        // Collection view tags.
        NSLayoutConstraint.activate([
            tagsCollectionView.topAnchor.constraint(equalTo: self.labelName.bottomAnchor, constant: 20),
            tagsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            tagsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            tagsCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
