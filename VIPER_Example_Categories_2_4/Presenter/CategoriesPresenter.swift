//
//  CategoriesPresenter.swift
//  VIPER_Example_Categories_2_4
//
//  Created by Лаура Есаян on 14.03.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import Foundation

class CategoriesPresenter: CategoriesPreseneterProtocol {
    var view: CategoriesViewProtocol?
    
    var interactor: CategoriesInteractorInputProtocol?
    
    var wireFrame: CategoriesWireFrameProtocol?
    
    func viewDidLoad() {
        interactor?.loadCategories()
    }
    
    
}

extension CategoriesPresenter: CategoriesInteractorOutputProtocol {
    func categoriesDidLoaded(categories: [Categories]) {
        view?.showCategories(with: categories)
    }
}
