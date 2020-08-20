//
//  viewCollectionViewCell.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 18/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class ViewCollectionViewCell: UIView {
    var imageTag: UIImage?
    var labelTag: String?
    
    lazy var veganButton: TagsButton = {
        let button = TagsButton(image: imageTag)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        label.text = labelTag
        label.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(veganButton)
        self.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            veganButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            veganButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            veganButton.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -16),
            veganButton.heightAnchor.constraint(equalToConstant: 37),
            veganButton.widthAnchor.constraint(equalToConstant: 36)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
