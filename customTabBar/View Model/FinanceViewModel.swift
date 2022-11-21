//
//  FinanceViewModel.swift
//  customTabBar
//
//  Created by Karnika Singh on 14/11/22.
//

import Foundation
import Alamofire

class FinanceViewModel : FinanceApiClent {
    var financeList: [FinancePage]? = []
    var financeProtocol: FinanceViewModelProtocol?
    
    func getFinanceList(completionHandler: @escaping (Bool) -> Void)  {
        financeProtocol = self
        financeProtocol?.getFinanceList(completionHandler: {[weak self] response, error in
            
            if (response != nil) {
                print(response!)
                
                let responseDict = response as? [String: AnyObject]
                let modelObj = CommonFunctions.sharedInstance.convertJsonToModel(responseDict ?? [:], modelType: FinancesModel.self)
                if modelObj == nil {
                    completionHandler(false)
                } else {
                    self?.financeList = modelObj?.data.pages
                    completionHandler(true)
                }
            } else {
                completionHandler (false)
            }
        })
    }
    
        func getAnotherFinanceList(completionHandler: @escaping (Bool) -> Void) {
            let headers: HTTPHeaders = [
                "token": "9446c321-c5a2-4883-8fad-bd53716f6829",
            ]
    
            AF.request("https://hrx-backend-staging.sequoia-development.com/px-client/custom-pages/finances", method:.get, encoding: JSONEncoding.default, headers: headers).responseJSON { [weak self] (response) in
    
                print("------ \(response)")
    
                switch response.result {
    
                case .success(let value):
                    
                    let responseDict = value as? [String: AnyObject]
                    let modelObj = CommonFunctions.sharedInstance.convertJsonToModel(responseDict ?? [:], modelType: FinanceListModel.self)

                    if modelObj != nil {
                        modelObj?.data?.forEach({ value in
                            let financePage = FinancePage(position: (self?.financeList?.count ?? 0) + 1, pageSlug: value.pageName ?? "")
                            self?.financeList?.append(financePage)
                        })
                        completionHandler(true)
                    } else {
                        completionHandler(false)
                    }

                case .failure(let error):
                    print("Error : \(error)")
                    completionHandler(false)
                }
            }
        }
}


class FinanceApiClent {}

extension FinanceApiClent: FinanceViewModelProtocol {
    
    func getFinanceList(completionHandler: @escaping ([String : Any]?, Error?) -> Void) {
        
        let headers: HTTPHeaders = [
            "token": "9446c321-c5a2-4883-8fad-bd53716f6829",
            "agent": "client"

        ]
        
        AF.request("https://hrx-backend-staging.sequoia-development.com/px-client/finances/capability", method:.get, encoding: JSONEncoding.default, headers: headers).responseJSON {(response) in
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
