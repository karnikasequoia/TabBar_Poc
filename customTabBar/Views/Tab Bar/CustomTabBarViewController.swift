//
//  CustomTabBarViewController.swift
//  customTabBar
//
//  Created by Usman Mukhtar on 09/01/2021.
//

import UIKit
import Alamofire

class FoodReviewApiClient {
    var shouldReturnError = false
    var loginWasCalled = false
    var requestReviewsWasCalled = false
    
    enum MockServiceError: Error {
        case login
        case requestReviews
    }
    
    func reset() {
        shouldReturnError = false
        loginWasCalled = false
        requestReviewsWasCalled = false
    }
    
    let mockReviewsResponse: [String: Any] = [
        "reviews" : [
            ["restaurantName": "Siam Thai Cuisine",
             "reviewTitle": "Authentic",
             "rating": 4.0,
             "reviewDescription": "Very authentic Thai food would definitely go back :)"
            ],
            ["restaurantName": "Seito Sushi",
             "reviewTitle": "Went out to a really good japanese restaurant",
             "rating": 4.5,
             "reviewDescription": "This restaurant was really good."
            ]
        ]
    ]
    
    let mockLoginResponse: [String: Any] = [
        "profile": [
            "userName" : "SuperFoodie",
            "description" : "I travel far and wide for the best food I can find.",
            "followers" : 108,
            "preferences" : ["japanese", "mexican", "thai", "italian", "german", "korean"]
        ]
    ]
}

class CustomTabBarViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var tabBarView: UIView!
    
    var childController: UIViewController?
    var mainStoryboard:UIStoryboard?
    let viewModel = CustomTabBarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        viewModel.getTabBarList(completionHandler: { [weak self] isSuccess in
            if isSuccess {
                self?.createTabBarXib()
            }
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addedInitialTabControlled()
    }
    
    func createTabBarXib() {
        let xibView = Bundle.main.loadNibNamed("TabBarView", owner: self, options: nil)!.first as! TabBarView
        xibView.tabBarDelegate = self
        xibView.tabList = viewModel.tabBarList ?? []
        xibView.frame = CGRect(x: 0, y: 0, width: tabBarView.frame.size.width, height: 80)
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tabBarView.addSubview(xibView)
    }
    
    func addedInitialTabControlled() {
        titleLabel.text = "Home"
        let viewController = mainStoryboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        childController = viewController
        viewController.foodReviewApiClient = ActualFoodApiClent()
        add(viewController, frame: viewContainer.frame)
    }
    
    @IBAction func notificationAction(_ sender: Any) {
    }
    
    @IBAction func profileAction(_ sender: Any) {
    }
}

extension CustomTabBarViewController: TabBarViewProtocol {
    func didSelectTab(item: UITabBarItem, tabBar: UITabBar) {
        childController?.remove()
        
        let value = viewModel.tabBarList?[item.tag]
        
        switch value?.pageSlug.uppercased() {
        
        case "DASHBOARD":
            addedInitialTabControlled()
            
        case "BENEFITS":
            titleLabel.text = "Benefits"
            let viewController = mainStoryboard?.instantiateViewController(withIdentifier: "BenefitViewController") as! BenefitViewController
            childController = viewController
            add(viewController, frame: viewContainer.frame)
        case "WELLBEING":
            titleLabel.text = "Wellbeing"
            let viewController = mainStoryboard?.instantiateViewController(withIdentifier: "WellBeingViewController") as! WellBeingViewController
            childController = viewController
            add(viewController, frame: viewContainer.frame)
        case "RTW":
            titleLabel.text = "Workplace"
            let viewController = mainStoryboard?.instantiateViewController(withIdentifier: "WorkPlaceViewController") as! WorkPlaceViewController
            childController = viewController
            add(viewController, frame: viewContainer.frame)
            
        case "FINANCES": // enter key values
            titleLabel.text = "Finances"
            let viewController = mainStoryboard?.instantiateViewController(withIdentifier: "FinanceViewController") as! FinanceViewController
            childController = viewController
            add(viewController, frame: viewContainer.frame)
            
        default:
            titleLabel.text = "Wellbeing Two"
            let viewController = mainStoryboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            childController = viewController
            add(viewController, frame: viewContainer.frame)
        }
    }
}

class ActualFoodApiClent {
    
}

extension ActualFoodApiClent: FoodReviewApiClientProtocol {
    
    func login(_ username: String, password: String, completionHandler: @escaping ([String : Any]?, Error?) -> Void) {
        let parameters: [String: Any] = [
            "email" : username,
            "password" : password
        ]
        
        AF.request("https://hrx-backend-staging.sequoia-development.com/idm/users/login", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
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
