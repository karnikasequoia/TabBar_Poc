//
//  CommonFunction.swift
//  customTabBar
//
//  Created by Karnika Singh on 14/11/22.
//

import Foundation

class CommonFunctions: NSObject{
    
    static let sharedInstance = CommonFunctions()
    
    private override init() {}
    
    func convertJsonToModel<T : Decodable> (_ object: [String: Any], modelType: T.Type) -> T? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
            
            let reqJsonStr = String(data: jsonData, encoding: .utf8)
            let data = reqJsonStr?.data(using: .utf8)
            let jsonDecoder = JSONDecoder()
            
            do {
                let modelObj = try jsonDecoder.decode(modelType, from: data!)
                return modelObj
            } catch {
                print("error \(error)")
                return nil
            }
        } catch {
            print("error \(error)")
            return nil
        }
        
        return nil
    }
    
}
