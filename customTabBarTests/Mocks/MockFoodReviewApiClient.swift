//
//  MockFoodReviewApiClient.swift
//  customTabBarTests
//
//  Created by Karnika Singh on 02/11/22.
//

import Foundation
import XCTest
@testable import customTabBar

class MockFoodReviewApiClient {

    let mockLoginResponse: [String: Any] = ["success": 1, "data": [
        "companyDetails":     [
            "clientOnboardingStatus": "",
            "companyColor" : "7ED321",
            "companyName" : "Mobile App Demo (ST)",
            "hrxDashboardVersion" : "V2",
            "lob" : "ST",
            "profileScreenBackgroundColor": "13253D"
        ],
        "isActivated" : 1,
        "isTerminated" : 0,
        "showWelcome" : 0,
        "userDetails" :     [
            "apiToken" : "c6cad99b-c5e1-4be0-855a-826a2882c71d",
            "assignedCompanies" :         [
                "0013300001nRKIGAA4"
            ],
            "contactId" : "0033300001rUboEAAS",
            "contactType" : "edi_contact",
            "dob" : "2001-01-01",
            "email" : "mobileapptest@sequoia.com",
            "firstName" : "Manish",
            "isEmployee" : 1,
            "isLimitedAccess" : 0,
            "isReviewEnabled" : 1,
            "lastName" : "Kumar",
            "lob" : "ST",
            "oktaId" : "00u1cdz6ia0paKCVk0h8",
            "oktaSessionId" : "102p5e_TfNLQtGnU3DYUClCIQ",
            "oktaSessionToken" : "20111rvTGuWoeS1pnFhMrom8kYrXXodE_YbiLW4sW6Rms35nedcHbGX",
            "oktaStatus" : "SUCCESS",
            "pushNotificationStatus" : 1,
            "secondaryEmail" : "appleidtest@sequoia.com",
            "status" : "active",
            "userId" : "89644",
            "userRole" : "sequoia_super_admin",
            "userType" : "client_employee",
        ]
    ]
    ]
    
    let mockFailureResponse: [String: Any] = ["success": 0]
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}


extension MockFoodReviewApiClient: FoodReviewApiClientProtocol {
    func login(_ username: String, password: String, completionHandler: @escaping ([String : Any]?, Error?) -> Void) {
        if isValidEmail(username) {
            completionHandler(mockLoginResponse, nil)
        } else {
            completionHandler(mockFailureResponse, nil)
        }
    }
}
