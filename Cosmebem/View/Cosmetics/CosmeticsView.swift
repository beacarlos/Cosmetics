//
//  Cosmetics.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 13/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class CosmeticsView: UIView {
    
    lazy var viewStatusBar: UIView = {
        let viewStatusBar = UIView()
        viewStatusBar.backgroundColor = UIColor(red: 0.94, green: 0.80, blue: 0.80, alpha: 1.00)
        viewStatusBar.translatesAutoresizingMaskIntoConstraints = false
        return viewStatusBar
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(viewStatusBar)
        viewBackgroundSearchBar(view: viewStatusBar, constant: 170)
    }
}
