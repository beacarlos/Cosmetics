//
//  OnBoardingView.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 24/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class OnBoardingView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Cosmetology of good."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = """
        Application with main objective to show you a description about cosmetics and if you have to show any tag, for example, if it is cruelty free or oil free.
        
        Enjoy!
        """
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageview: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "onboard")
        return image
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("START", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 0.63, green: 0.49, blue: 0.48, alpha: 1.00)
        button.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var dismissAction: (() -> Void)!
    @objc func dismiss() {
        dismissAction()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(imageview)
        self.addSubview(titleLabel)
        self.addSubview(bodyLabel)
        self.addSubview(startButton)

        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageview.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            imageview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            imageview.heightAnchor.constraint(equalToConstant: 318),
            imageview.widthAnchor.constraint(equalToConstant: 369)
            
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.imageview.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            bodyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            bodyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
            
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            startButton.widthAnchor.constraint(equalTo: bodyLabel.widthAnchor, multiplier: 1),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
