//
//  CosmeticsViewController.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 13/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class CosmeticsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController(title: "Cosmetics")
        view.addSubview(CosmeticsView(frame: view.frame))
        configuretableView()
    }
    
    let table: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .none
        tableView.rowHeight = 85
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CosmeticsTableViewCell.self, forCellReuseIdentifier: "CosmeticsTableViewCell")
        return tableView
    }()
    
    private func setupNavigationController(title: String, largeTitle: Bool = true) {
        self.title = title
        self.navigationController?.navigationBar.prefersLargeTitles = largeTitle
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.94, green: 0.80, blue: 0.80, alpha: 1.00)
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.63, green: 0.49, blue: 0.48, alpha: 1.00)
        navigationItem.largeTitleDisplayMode = .always
    }
    
    // Set delegates.
    func configuretableView() {
        table.delegate = self
        table.dataSource = self
        view.addSubview(table)
        tableViewConstraints()
    }
}

extension CosmeticsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CosmeticsTableViewCell") as? CosmeticsTableViewCell else {
            return CosmeticsTableViewCell()
        }
        cell.labelTag = categories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = DescriptionCosmeticsViewController()
        destination.tag = categories[indexPath.row]
        destination.findCategorie = findName[indexPath.row]
        destination.descriptionProductType = descriptionType[indexPath.row]
        navigationController?.pushViewController(destination, animated: true)
    }
}

extension CosmeticsViewController {
    func tableViewConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
