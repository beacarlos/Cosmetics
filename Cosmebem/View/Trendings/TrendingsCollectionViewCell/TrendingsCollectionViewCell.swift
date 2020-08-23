//
//  TrendingsCollectionViewCell.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 13/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class TrendingsCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor(red: 0.94, green: 0.80, blue: 0.80, alpha: 1.00).cgColor
        view.backgroundColor = UIColor(red: 0.94, green: 0.80, blue: 0.80, alpha: 1.00)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // shadow
        view.layer.shadowColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.23).cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 2
        return view
    }()
    
    lazy var categorieLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Blush"
        return label
    }()
    
    lazy var cosmeticLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Diorskin Rosy Glow"
        return label
    }()
    
    lazy var brandLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dior"
        return label
    }()
    
    lazy var cosmeticImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blush")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        //round only specific corners.
        imageView.layer.cornerRadius = 15
        imageView.layer.maskedCorners =  [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        // image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var tagsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var tagImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "organic-white")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private func setupUI() {
        self.contentView.addSubview(roundedBackgroundView)
        roundedBackgroundView.addSubview(categorieLabel)
        roundedBackgroundView.addSubview(cosmeticLabel)
        roundedBackgroundView.addSubview(cosmeticImage)
        roundedBackgroundView.addSubview(brandLabel)
        roundedBackgroundView.addSubview(tagsStackView)
        
        tagsStackView.addArrangedSubview(tagImage)
        contraints()
    }
    
    func contraints() {
        NSLayoutConstraint.activate([
            roundedBackgroundView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            roundedBackgroundView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            roundedBackgroundView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            roundedBackgroundView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            categorieLabel.topAnchor.constraint(equalTo: roundedBackgroundView.topAnchor, constant: 16),
            categorieLabel.leadingAnchor.constraint(equalTo: roundedBackgroundView.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            cosmeticLabel.topAnchor.constraint(equalTo: categorieLabel.bottomAnchor, constant: 16),
            cosmeticLabel.leadingAnchor.constraint(equalTo: roundedBackgroundView.leadingAnchor, constant: 16),
            cosmeticLabel.trailingAnchor.constraint(equalTo: cosmeticImage.leadingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            cosmeticImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            cosmeticImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            cosmeticImage.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.5),
            cosmeticImage.heightAnchor.constraint(equalTo: self.contentView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            brandLabel.topAnchor.constraint(equalTo: cosmeticLabel.bottomAnchor, constant: 16),
            brandLabel.leadingAnchor.constraint(equalTo: roundedBackgroundView.leadingAnchor, constant: 16),
            brandLabel.trailingAnchor.constraint(equalTo: cosmeticImage.leadingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            tagsStackView.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 32),
            tagsStackView.leadingAnchor.constraint(equalTo: roundedBackgroundView.leadingAnchor, constant: 16),
            tagsStackView.trailingAnchor.constraint(equalTo: cosmeticImage.leadingAnchor),
            tagsStackView.bottomAnchor.constraint(equalTo: roundedBackgroundView.bottomAnchor, constant: -16)
        ])
    }
}
