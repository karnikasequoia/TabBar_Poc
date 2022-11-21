//
//  HomeViewController.swift
//  customTabBar
//
//  Created by Karnika Singh on 14/10/22.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var foodReviewApiClient: FoodReviewApiClientProtocol?
    var source: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.stopAnimating()
    }
    
    init(source : String) {
        super.init(nibName: nil, bundle: nil)
        self.source = "storyboard"
    }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.source = "storyboard"
        }
    
    @IBAction func loginAction(_ sender: Any) {
        activityIndicator.startAnimating()
        callLoginApi(username: "mobileapptest@sequoia.com", password: "Mobile2019$!", completionHandler: { modelObj, errorStr in
            if modelObj != nil {
                print("Success!")
            } else {
                print("Failed!")
            }
        })
    }
    
    func callLoginApi(username: String, password: String, completionHandler: @escaping (LoginResponse?, String?) -> Void)  {
        foodReviewApiClient?.login(username, password: password, completionHandler: { [weak self] response, error in
            self?.activityIndicator.stopAnimating()
            
            if (response != nil) {
                print(response!)
               
                let modelObj = self?.convertJsonObjectToModel(response ?? [:], modelType: LoginResponse.self)
                
                if modelObj?.success == 1 {
                    completionHandler (modelObj, nil)
                } else {
                    completionHandler (nil, "Failed")
                }
            } else {
                completionHandler (nil, error?.localizedDescription ?? "")
            }
        })
    }
    
    func convertJsonObjectToModel <T: Decodable>(_ object: [String: Any], modelType: T.Type) -> T? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
            
            let reqJSONStr = String(data: jsonData, encoding: .utf8)
            let data = reqJSONStr?.data(using: .utf8)
            let jsonDecoder = JSONDecoder()
            do {
                let modelObj = try jsonDecoder.decode(modelType, from: data!)
                return modelObj
            } catch {
                print("error \(error)")
            }
        } catch {
            print("error \(error)")
        }
        return nil
    }
}
