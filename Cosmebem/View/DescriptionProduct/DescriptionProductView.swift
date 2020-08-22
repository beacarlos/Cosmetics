//
//  DescriptionProductView.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 21/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class DescriptionProductView: UIView {
    lazy var imageView: UIImageView = {
        let imageV = UIImageView()
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.contentMode = .scaleAspectFill
        imageV.backgroundColor = .white
        imageV.clipsToBounds = true
        return imageV
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.text = "Nome do produto"
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textDescription: UITextView = {
        let text = UITextView()
        text.text = ""
        text.textColor = .black
        text.isEditable = false
        text.backgroundColor = .none
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isScrollEnabled = false
        return text
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.98, green: 0.94, blue: 0.93, alpha: 1.00)
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(textDescription)
        autoLayout()
    }
    
    func autoLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 4/10)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 7),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textDescription.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 7),
            textDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
