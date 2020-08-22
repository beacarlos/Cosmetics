//
//  DescriptionProductViewController.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 21/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class DescriptionProductViewController: UIViewController {
    var descriptionProduct = [Product]()
    
    lazy var viewB: DescriptionProductView =  {
        let view = DescriptionProductView(frame: self.view.frame)
        view.imageView.downloaded(from: "https:" + descriptionProduct[0].apiFeaturedImage!)
        view.titleLabel.text = descriptionProduct[0].name!
        view.textDescription.text = descriptionProduct[0].productDescription!
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(viewB)
    }
}
