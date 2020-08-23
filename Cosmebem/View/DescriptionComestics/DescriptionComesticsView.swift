//
//  DescriptionComesticsView.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 22/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class DescriptionComesticsView: UIView {
    lazy var viewDescription: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.94, green: 0.80, blue: 0.80, alpha: 1.00)
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor(red: 0.94, green: 0.80, blue: 0.80, alpha: 1.00).cgColor
        
        // shadow
        view.layer.shadowColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.23).cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var textDescription: UITextView = {
        let text = UITextView()
        text.text = "The blush can restore naturalness to a skin that has been worked with foundation, concealer and powder. Blush can also be used to shape the face, enhance the bone structure and its best features."
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
        addSubview(viewDescription)
        viewDescription.addSubview(textDescription)
        autoLayout()
    }
    
    func autoLayout() {
        NSLayoutConstraint.activate([
            viewDescription.topAnchor.constraint(equalTo: self.topAnchor),
            viewDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewDescription.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 4/10)
        ])
        
        NSLayoutConstraint.activate([
            textDescription.topAnchor.constraint(equalTo: self.topAnchor),
            textDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            textDescription.bottomAnchor.constraint(equalTo: self.viewDescription.bottomAnchor)
        ])
    }
}
