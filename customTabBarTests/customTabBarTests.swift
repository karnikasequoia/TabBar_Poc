//
//  customTabBarTests.swift
//  customTabBarTests
//
//  Created by Karnika Singh on 02/11/22.
//

@testable import customTabBar
import XCTest

final class customTabBarTests: XCTestCase {

    var customTabBarVM :CustomTabBarViewModel?
    var customTabBarProtocol: CustomTabBarViewModelProtocol?
    
    func testCustomTabBarAPI() {
        
        customTabBarVM = CustomTabBarViewModel()
        customTabBarVM?.customTabbarProtocol = MockCustomTabbarApiClient()
        
        customTabBarVM?.getTabBarList(completionHandler: { isSuccess  in
            if isSuccess {
                XCTAssertNotNil(isSuccess)
            } else {
                XCTFail("Test Failed")
            }
        })
    }
}
