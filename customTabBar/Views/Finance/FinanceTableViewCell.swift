//
//  FinanceTableViewCell.swift
//  customTabBar
//
//  Created by Karnika Singh on 15/11/22.
//

import UIKit

class FinanceTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView! {
        didSet {
            baseView.layer.borderWidth = 1
            baseView.layer.borderColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1.0).cgColor
        }
    }
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        listImageView.image = UIImage(named: "workplaceTabBar.png")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
