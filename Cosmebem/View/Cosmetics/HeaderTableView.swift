//
//  HeaderTableView.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 17/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class HeaderTableView: UIView {
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 200, height: 30))
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        label.textAlignment = .left
        label.text = "Categorias"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        self.backgroundColor = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
