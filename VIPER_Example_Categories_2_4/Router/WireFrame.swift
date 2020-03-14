//
//  WireFrame.swift
//  VIPER_Example_Categories_2_4
//
//  Created by Лаура Есаян on 14.03.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import Foundation

class CategoriesWireFrame: CategoriesWireFrameProtocol {
    class func createCategoriesModule(categoriesRef: ViewController) {
        let presenter: CategoriesPreseneterProtocol & CategoriesInteractorOutputProtocol = CategoriesPresenter()
        
        categoriesRef.presenter = presenter
        categoriesRef.presenter?.wireFrame = CategoriesWireFrame()
        categoriesRef.presenter?.view = categoriesRef
        categoriesRef.presenter?.interactor = CategoriesInteractor()
        categoriesRef.presenter?.interactor?.presenter = presenter
    }
}
