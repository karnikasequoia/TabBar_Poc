//
//  CustomTabBarViewController.swift
//  customTabBar
//
//  Created by Usman Mukhtar on 09/01/2021.
//

import UIKit

class CustomTabBarViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var tabBarView: UIView!
    
    var childController: UIViewController?
    var mainStoryboard:UIStoryboard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        createTabBarXib()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addedInitialTabControlled()
    }
    
    
    func createTabBarXib() {
        let xibView = Bundle.main.loadNibNamed("TabBarView", owner: self, options: nil)!.first as! TabBarView
        xibView.tabBarDelegate = self
        xibView.tabBar.selectedItem = xibView.tabBar.items![0]
        xibView.frame = CGRect(x: 0, y: 0, width: tabBarView.frame.size.width, height: 80)
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tabBarView.addSubview(xibView)
        
    }

    func addedInitialTabControlled() {
        titleLabel.text = "Home"
        let viewController = mainStoryboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        childController = viewController
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
        
        switch item.tag {
        case 1:
            addedInitialTabControlled()
            
        case 2:
            titleLabel.text = "Benefit"
            let viewController = mainStoryboard?.instantiateViewController(withIdentifier: "BenefitViewController") as! BenefitViewController
            childController = viewController
            add(viewController, frame: viewContainer.frame)
        
        case 3:
            titleLabel.text = "Workplace"
            let viewController = mainStoryboard?.instantiateViewController(withIdentifier: "WorkPlaceViewController") as! WorkPlaceViewController
            childController = viewController
            add(viewController, frame: viewContainer.frame)
            
        case 4:
            titleLabel.text = "Wellbeing"
            let viewController = mainStoryboard?.instantiateViewController(withIdentifier: "WellBeingViewController") as! WellBeingViewController
            childController = viewController
            add(viewController, frame: viewContainer.frame)
            
        case 5:
            titleLabel.text = "Wellbeing"
            let viewController = mainStoryboard?.instantiateViewController(withIdentifier: "WellBeingViewController") as! WellBeingViewController
            childController = viewController
            add(viewController, frame: viewContainer.frame)
            
        case 6:
            titleLabel.text = "Wellbeing One"
            let viewController = mainStoryboard?.instantiateViewController(withIdentifier: "WellBeingOneViewController") as! WellBeingOneViewController
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
