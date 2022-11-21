//
//  FinanceViewController.swift
//  customTabBar
//
//  Created by Karnika Singh on 17/11/22.
//

import UIKit

class FinanceViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = FinanceViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeXIB()
        viewModel.getFinanceList { [weak self] isSuccess in
            if isSuccess {
                self?.tableView.reloadData()
                self?.callAnotherListApi()
            }
        }
    }
    
    func callAnotherListApi() {
        viewModel.getAnotherFinanceList {[weak self] isSuccess in
            self?.tableView.reloadData()
        }
    }
    
    func initializeXIB() {
        tableView.register(UINib(nibName: "FinanceTableViewCell", bundle: nil), forCellReuseIdentifier: "FinanceTableViewCell")
    }
}

extension FinanceViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.financeList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FinanceTableViewCell", for: indexPath) as! FinanceTableViewCell
        cell.titleLabel.text = viewModel.financeList?[indexPath.row].pageSlug
        return cell
    }
}
