//
//  CategoriesProtocols.swift
//  VIPER_Example_Categories_2_4
//
//  Created by Лаура Есаян on 13.03.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import Foundation

protocol CategoriesViewProtocol: class {
    func showCategories(with categories: [Categories])
}

protocol CategoriesInteractorInputProtocol: class {
    var presenter: CategoriesInteractorOutputProtocol? {get set}
    
    func loadCategories()
}

protocol CategoriesInteractorOutputProtocol: class {
    func categoriesDidLoaded(categories: [Categories])
}

protocol CategoriesWireFrameProtocol: class {
    
}

protocol CategoriesPreseneterProtocol {
    var view: CategoriesViewProtocol? {get set}
    var interactor: CategoriesInteractorInputProtocol? {get set}
    var wireFrame: CategoriesWireFrameProtocol? {get set}
    
    func viewDidLoad()
}
