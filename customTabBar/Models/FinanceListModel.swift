//
//  FinanceListModel.swift
//  customTabBar
//
//  Created by Karnika Singh on 21/11/22.
//

import Foundation


struct FinanceListModel : Codable {
    let success: Bool?
    let message: String?
    let data: [FinanceData]?
}

struct FinanceData: Codable {
    let companyId: Int?
    let countryCode: String?
    let createdAt: String?
    let icon: String?
    let iconUrl:String?
    let id: Int?
    let image: String?
    let pageId:String?
    let pageName: String?
    let pageSlug: String?
    let subtitle: String?
    let updatedAt: String?
    let updatedBy: Int?
}
