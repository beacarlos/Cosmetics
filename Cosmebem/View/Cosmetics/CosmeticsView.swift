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
    
    let table: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .none
        tableView.rowHeight = 85
        tableView.backgroundColor = .purple
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CosmeticsTableViewCell.self, forCellReuseIdentifier: "CosmeticsTableViewCell")
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(viewStatusBar)
        addSubview(table)
        viewBackgroundSearchBar(view: viewStatusBar, constant: 170)
    }
    
    func autoLayout() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            table.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
