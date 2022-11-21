//
//  TabBarModel.swift
//  customTabBar
//
//  Created by Karnika Singh on 13/11/22.
//

import Foundation

struct TabBarModel: Codable {
    let data: TabBarData
    let message: String
    let success: Bool
}

// MARK: - DataClass
struct TabBarData : Codable {
    let summary: Bool
    let pages: [Page]
    let manageGroups, adminExperience: Bool
    let employeeType: String
    let taxBalances: Bool
    let experience: String
    let addFunds: Bool
    let showCustomGroups: Bool
}

// MARK: - Page
struct Page : Codable {
    let actions: [String]?
    let position: Int
    let pageSlug: String
    let version: String?
    let cbSites: CbSites?
}

// MARK: - CbSites
struct CbSites : Codable {
    let global: Bool
    let oneClick: String
    let oe, pir: Bool
}
