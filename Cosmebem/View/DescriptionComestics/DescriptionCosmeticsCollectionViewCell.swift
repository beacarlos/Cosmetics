//
//  DescriptionCosmeticsCollectionViewCell.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 22/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class DescriptionCosmeticsCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView = {
        var imageView =  UIImageView()
        imageView.image = .none
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 5
        imageView.layer.borderColor = UIColor(red: 0.94, green: 0.80, blue: 0.80, alpha: 1.00).cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        // shadow
        imageView.layer.shadowColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.23).cgColor
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 2
        
        return imageView
    }()
    
    override func layoutSubviews() {
        imageView.layer.shadowPath = UIBezierPath(rect: imageView.bounds).cgPath
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addSubview(imageView)
        configureImageViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
