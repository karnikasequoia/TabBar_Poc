//
//  CustomTabBarViewModel.swift
//  customTabBar
//
//  Created by Karnika Singh on 13/11/22.
//

import Foundation
import Alamofire

class CustomTabBarViewModel: CustomTabBarApiClient {
    
    var tabBarList: [Page]? = []
    var customTabbarProtocol: CustomTabBarViewModelProtocol?
    
    func getTabBarList(completionHandler: @escaping (Bool) -> Void) {
        customTabbarProtocol = self
        customTabbarProtocol?.getCustomTabBarList(completionHandler: {[weak self] response, error in
            if (response != nil) {
                print(response!)
                completionHandler(true)
                
                let responseDict = response as? [String: AnyObject]
                let modelObj = CommonFunctions.sharedInstance.convertJsonToModel(responseDict ?? [:], modelType: TabBarModel.self)
                if modelObj == nil {
                    completionHandler(false)
                } else {
                    self?.tabBarList = modelObj?.data.pages
                    completionHandler(true)
                }
            } else {
                completionHandler (false)
            }
        })
    }
}

class CustomTabBarApiClient {}

extension CustomTabBarApiClient: CustomTabBarViewModelProtocol {
    func getCustomTabBarList(completionHandler: @escaping ([String : Any]?, Error?) -> Void) {
        let headers: HTTPHeaders = [
            "token": "9446c321-c5a2-4883-8fad-bd53716f6829",
        ]
        
        AF.request("https://hrx-backend-staging.sequoia-development.com/px-client/capability", method:.get, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result {
                
            case .success(let response):
                completionHandler(response as? [String : Any], nil)
                print(response)
                
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
}


