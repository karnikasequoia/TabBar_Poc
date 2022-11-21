//
//  FinancesModel.swift
//  customTabBar
//
//  Created by Karnika Singh on 14/11/22.
//

import Foundation

struct FinancesModel : Codable {
    let message: String
    let success: Bool
    let data: DataClass
}

// MARK: - DataClass
struct DataClass : Codable {
    let pages: [FinancePage]
}

// MARK: - Page
struct FinancePage : Codable {
    let position: Int
    let pageSlug: String
}
