//
//  CosmeticsViewController.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 13/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class CosmeticsViewController: UIViewController {
    let headerTableView: [String] = ["Blush", "Bronzer", "Eyebrow", "Eyeliner", "Foundation", "Lipstick", "Mascara"]
    
    var comestics: [Product] = []
    
    func callAPI() {
        for type in headerTableView {
            Service.shared.findProductByType(productType: type) { (product) in
                guard let produt: [Product] = product else {
                    return
                }
                print(produt)
            }
        }
        //        DispatchQueue.main.async {
        //            self.tableView.reloadData()
        //        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()
        view.addSubview(CosmeticsView(frame: view.frame))
        setupNavigationController(title: "Cosmetics")
        self.view.addSubview(tableView)
        tableView.register(CosmeticsTableViewCell.self, forCellReuseIdentifier: "CosmeticsTableViewCell")
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(red: 0.98, green: 0.94, blue: 0.93, alpha: 1.00)
        tableView.rowHeight = 200 // Altura de cada linha da table view.
        tableView.sectionHeaderHeight = 30
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    func setupNavigationController(title: String, largeTitle: Bool = true) {
        let searchController = UISearchController(searchResultsController: nil)
        self.title = title
        self.navigationController?.navigationBar.prefersLargeTitles = largeTitle
        navigationItem.searchController = searchController
    }
}

extension CosmeticsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderTableView()
        header.label.text = headerTableView[section]
        return header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        cell.titleLabel.text = titles[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CosmeticsTableViewCell") as? CosmeticsTableViewCell else {
            return CosmeticsTableViewCell()
        }
        return cell
    }
}
