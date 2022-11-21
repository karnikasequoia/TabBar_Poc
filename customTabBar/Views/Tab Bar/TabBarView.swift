//
//  TabBarView.swift
//  customTabBar
//
//  Created by Karnika Singh on 14/10/22.
//

import UIKit

protocol TabBarViewProtocol {
    func didSelectTab(item: UITabBarItem, tabBar: UITabBar)
}

class TabBarView: UIScrollView, UITabBarDelegate {
    
    var tabBarDelegate: TabBarViewProtocol?
    var tabList: [Page]? {
        didSet {
            for (index, value) in (tabList ?? []).enumerated() {
                let item = UITabBarItem()
                item.tag = index
                item.image = UIImage(named: "workplaceTabBar.png")
                if value.pageSlug.uppercased() == "DASHBOARD" {
                    item.title = "HOME"
                } else {
                    item.title = value.pageSlug.uppercased()
                }
                tabBar.items?.append(item)
            }
            
            if !(tabBar.items?.isEmpty ?? false) {
                tabBar.selectedItem = tabBar.items?[0]
            }
            
        }
    }
    
    @IBOutlet weak var tabBar: UITabBar!  {
        didSet {
            tabBar.delegate = self
        }
    }
    
    class _DelegateProxy: NSObject, UIScrollViewDelegate {
        weak var _userDelegate: UIScrollViewDelegate?
        
        override func responds(to aSelector: Selector!) -> Bool {
            return super.responds(to: aSelector) || _userDelegate?.responds(to: aSelector) == true
        }
        
        override func forwardingTarget(for aSelector: Selector!) -> Any? {
            if _userDelegate?.responds(to: aSelector) == true {
                return _userDelegate
            }
            
            return super.forwardingTarget(for: aSelector)
        }
        
        //This function is just a demonstration, it can be replaced/removed.
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            _userDelegate?.scrollViewDidScroll?(scrollView)
        }
    }
    
    fileprivate let _delegateProxy = _DelegateProxy()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        super.delegate = _delegateProxy
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.delegate = _delegateProxy
    }
    
    override var delegate: UIScrollViewDelegate? {
        get {
            return _delegateProxy._userDelegate
        }
        
        set {
            _delegateProxy._userDelegate = newValue
        }
    }
    
    func didScroll() {
        print("didScroll")
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        tabBar.selectedItem = item
        tabBarDelegate?.didSelectTab(item: item, tabBar: tabBar)
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}


