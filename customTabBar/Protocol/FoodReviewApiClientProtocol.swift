//
//  FoodReviewApiClientProtocol.swift
//  customTabBar
//
//  Created by Karnika Singh on 02/11/22.
//

import Foundation

protocol FoodReviewApiClientProtocol {
    func login(_ username: String, password: String, completionHandler: @escaping ([String : Any]?, Error?) -> Void)
}
