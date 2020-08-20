//
//  TagsButton.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 14/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class TagsButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(image: UIImage!) {
        super.init(frame: .zero)
        contentMode = .scaleAspectFit
        setBackgroundImage(image, for: UIControl.State.normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
