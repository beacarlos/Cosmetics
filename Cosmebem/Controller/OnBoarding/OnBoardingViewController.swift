//
//  OnBoardingViewController.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 24/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {
    lazy var onBoardingView: OnBoardingView = {
        let view = OnBoardingView()
        view.dismissAction = {
            self.dismiss(animated: true, completion: nil)
        }
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = onBoardingView
    }
}
