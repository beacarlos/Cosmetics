//
//  TagTableViewCell.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 13/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class TagTableViewCell: UITableViewCell {
    var imageTag: UIImage?
    var labelTag: String?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    lazy var viewTableViewCell: UIView =  {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(red: 0.94, green: 0.80, blue: 0.80, alpha: 1.00).cgColor
        
        // shadow
        view.layer.shadowColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.23).cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 2
        return view
    }()
    
    lazy var iconTags: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = imageTag
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
}

extension TagTableViewCell {
    private func setupUI() {
        self.contentView.addSubview(viewTableViewCell)
        viewTableViewCell.addSubview(titleLabel)
        viewTableViewCell.addSubview(iconTags)
        self.contentView.backgroundColor = UIColor(red: 0.98, green: 0.94, blue: 0.93, alpha: 1.00)
        
        NSLayoutConstraint.activate([
            viewTableViewCell.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            viewTableViewCell.heightAnchor.constraint(equalToConstant: 70),
            viewTableViewCell.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 18),
            viewTableViewCell.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -18)
        ])
        
        NSLayoutConstraint.activate([
            iconTags.centerYAnchor.constraint(equalTo: self.viewTableViewCell.centerYAnchor),
            iconTags.leadingAnchor.constraint(equalTo: self.viewTableViewCell.leadingAnchor, constant: 20),
            iconTags.heightAnchor.constraint(equalToConstant: 37),
            iconTags.widthAnchor.constraint(equalToConstant: 36)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.viewTableViewCell.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.iconTags.trailingAnchor, constant: 20)
        ])
    }
}
