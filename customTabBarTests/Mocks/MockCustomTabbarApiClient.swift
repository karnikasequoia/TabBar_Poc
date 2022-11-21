//
//  MockCustomTabbarApiClient.swift
//  customTabBarTests
//
//  Created by Karnika Singh on 21/11/22.
//

import Foundation
@testable import customTabBar

class MockCustomTabbarApiClient {
    let mockCustomTabbarResponse: [String: Any] = ["data":
                                                    ["summary":true,
                                                     "pages":
                                                        [["actions":
                                                            ["findCare",
                                                             "idCards",
                                                             "balances"],
                                                          "position":1,
                                                          "pageSlug":"dashboard"],
                                                         ["version":"V2",
                                                          "cbSites":
                                                            ["global":false,
                                                             "oneClick":"OE_ENROLLMENT",
                                                             "oe":true,
                                                             "pir":true],
                                                          "pageSlug":"benefits",
                                                          "position":2],
                                                         ["position":3,
                                                          "pageSlug":"wellbeing"],
                                                         ["version":"V2",
                                                          "position":5,
                                                          "pageSlug":"rtw"],["position":4,
                                                                             "pageSlug":"finances"]],
                                                     "manageGroups":false,
                                                     "adminExperience":true,
                                                     "employeeType":"EDI_Employee",
                                                     "taxBalances":true,
                                                     "experience":"P/P+",
                                                     "addFunds":true,
                                                     "limitedAccess":"",
                                                     "showCustomGroups":true],
                                                   "message":"success",
                                                   "success":true]

    
    let mockFailedCustomTabbarResponse: [String: Any] = ["data":
                                                            ["summary":true,
                                                             "pages":
                                                                [["actions":
                                                                    ["findCare",
                                                                     "idCards",
                                                                     "balances"],
                                                                  "position":1,
                                                                  "pageSlug":"dashboard"],
                                                                 ["version":"V2",
                                                                  "cbSites":
                                                                    ["global":false,
                                                                     "oneClick":"OE_ENROLLMENT",
                                                                     "oe":true,
                                                                     "pir":true],
                                                                  "pageSlug":"benefits",
                                                                  "position":2],
                                                                 ["position":3,
                                                                  "pageSlug":"wellbeing"],
                                                                 ["version":"V2",
                                                                  "position":5,
                                                                  "pageSlug":"rtw"],["position":4,
                                                                                     "pageSlug":"finances"]],
                                                             "manageGroups":false,
                                                             "adminExperience":true,
                                                             "employeeType":"EDI_Employee",
                                                             "taxBalances":true,
                                                             "experience":"P/P+",
                                                             "addFunds":true,
                                                             "limitedAccess":"",
                                                             "showCustomGroups":1],
                                                           "message":"success",
                                                           "success":true]
    
}

extension MockCustomTabbarApiClient : CustomTabBarViewModelProtocol {
    func getCustomTabBarList(completionHandler: @escaping ([String : Any]?, Error?) -> Void) {
            completionHandler(mockCustomTabbarResponse, nil)
    }
}
