//
//  FinanceViewModelProtocol.swift
//  customTabBar
//
//  Created by Karnika Singh on 20/11/22.
//

import Foundation

protocol FinanceViewModelProtocol {
    func getFinanceList(completionHandler: @escaping ([String : Any]?, Error?) -> Void)
}
