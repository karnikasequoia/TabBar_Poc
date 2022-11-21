//
//  FinanceViewModelTest.swift
//  customTabBarTests
//
//  Created by Karnika Singh on 17/11/22.
//

import XCTest
@testable import customTabBar

final class FinanceViewModelTest: XCTestCase {

    var financeVM :FinanceViewModel?
    var financeProtocol: FinanceViewModelProtocol?
    
    func testFinanceListAPI() {
        
        financeVM = FinanceViewModel()
        financeVM?.financeProtocol = MockFinanceViewModel()
        
        financeVM?.getFinanceList(completionHandler: { isSuccess in
            if isSuccess {
                XCTAssertNotNil(isSuccess)
            } else {
                XCTFail("Test Failed")
            }
        })
    }
}
