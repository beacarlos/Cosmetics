//
//  TagsCollectionViewCell.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 22/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class TagsCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var labelTag: UILabel = {
        let label = UILabel()
        label.text = "Teste"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
        return label
    }()
}

extension TagsCollectionViewCell {
    private func setupUI() {
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(labelTag)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 94),
            imageView.heightAnchor.constraint(equalToConstant: 92)
        ])
        
        NSLayoutConstraint.activate([
            labelTag.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 16),
            labelTag.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            labelTag.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
    }
}
