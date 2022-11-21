//
//  MockFinanceViewModel.swift
//  customTabBarTests
//
//  Created by Karnika Singh on 17/11/22.
//

import Foundation
@testable import customTabBar

class MockFinanceViewModel {
    let mockFinanceResponse: [String: Any] = ["message":"success",
                                            "success":true,
                                            "data": [
                                                "pages":[["planId":"",
                                                          "planName":"",
                                                          "position":3,
                                                          "pageSlug":"TaxSaving"],
                                                         ["planId":"",
                                                          "planName":"",
                                                          "position":5,
                                                          "pageSlug":"Payroll"],
                                                         ["planId":"",
                                                          
                                                          "planName":"",
                                                          "position":6,
                                                          "pageSlug":"Explore"]
                                                        ]
                                                    ]
                                            ]

    
    let mockFailedFinanceResponse: [String: Any] = ["message":"success",
                                            "success":true,
                                            "data": [
                                                "pages":[["planId":"",
                                                          "planName":"",
                                                          "position":"",
                                                          "pageSlug":"TaxSaving"],
                                                         ["planId":"",
                                                          "planName":"",
                                                          "position":5,
                                                          "pageSlug":"Payroll"],
                                                         ["planId":"",
                                                          
                                                          "planName":"",
                                                          "position":6,
                                                          "pageSlug":"Explore"]
                                                        ]
                                                    ]
                                            ]
    
}

extension MockFinanceViewModel : FinanceViewModelProtocol {
    func getFinanceList(completionHandler: @escaping ([String : Any]?, Error?) -> Void) {
            completionHandler(mockFinanceResponse, nil)
    }
}
