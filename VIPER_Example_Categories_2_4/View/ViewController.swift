//
//  ViewController.swift
//  VIPER_Example_Categories_2_4
//
//  Created by Лаура Есаян on 13.03.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, CategoriesViewProtocol {
    @IBOutlet weak var categoriesTableView: UITableView!
    var presenter: CategoriesPreseneterProtocol?
    var categoriesList = [Categories]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoriesWireFrame.createCategoriesModule(categoriesRef: self)
        presenter?.viewDidLoad()
    }

    func showCategories(with categories: [Categories]) {
        categoriesList = categories
        categoriesTableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoriesTableView.dequeueReusableCell(withIdentifier: "CategoriesCell") as! CategoriesTableViewCell
        
        cell.nameLabel.text = categoriesList[indexPath.row].name
        
        var url = URL(string: "\(defaultStartAddress)\(categoriesList[indexPath.row].iconImage)")
        // При отсутствии картинки вставялем дефолтную
        if categoriesList[indexPath.row].iconImage.isEmpty {
            url = URL(string: defaultImageURL)
        }

        cell.iconImageView.kf.setImage(with: url)
        
        return cell
    }
    
}

