//
//  CategoriesInteractor.swift
//  VIPER_Example_Categories_2_4
//
//  Created by Лаура Есаян on 13.03.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import Foundation
import Alamofire

class CategoriesInteractor: CategoriesInteractorInputProtocol {
    var presenter: CategoriesInteractorOutputProtocol?
    var loadedCategories = [Categories]()
    
    func loadCategories() {
        loadCategoriesFromURL(url: categoriesURL) { [weak self] c in
            self?.loadedCategories = c
            self?.presenter?.categoriesDidLoaded(categories: self!.loadedCategories)
        }
    }
    
    func loadCategoriesFromURL(url: String, getLoadedCategories: @escaping ([Categories]) -> Void){
        var categoriesList = [Categories]()
        AF.request(url).responseJSON {
            response in
            if let json = response.value,
                let jsonDict = json as? NSDictionary {
                for (_, data) in jsonDict {
                    if let categories = Categories(data: data as! NSDictionary) {
                        categoriesList.append(categories)
                    }
                }
                
                DispatchQueue.main.async {
                    getLoadedCategories(categoriesList)
                }
            }
        }
    }
    
}
