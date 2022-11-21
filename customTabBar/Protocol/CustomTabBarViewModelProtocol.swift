//
//  CustomTabBarViewModelProtocol.swift
//  customTabBar
//
//  Created by Karnika Singh on 21/11/22.
//

import Foundation

protocol CustomTabBarViewModelProtocol {
    func getCustomTabBarList(completionHandler: @escaping ([String : Any]?, Error?) -> Void)
}

