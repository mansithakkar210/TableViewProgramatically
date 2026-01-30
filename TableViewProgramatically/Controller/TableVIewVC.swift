//
//  TableVIewVC.swift
//
//  TableVIewVC
//  Created by Mansi Thakkar on 2026-01-28.
//

import UIKit

class TableVIewVC: UIViewController {

    var sampleTableView :UITableView?
    var objAccountData: [AccountInfo]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        objAccountData = AccountInfo.getMockData()
        setupTableView()
    }

    func setupTableView() {
        sampleTableView = UITableView()
        sampleTableView?.translatesAutoresizingMaskIntoConstraints = false
        sampleTableView?.register(BankAccountsCell.self, forCellReuseIdentifier: "BankAccountsCell")
        sampleTableView?.register(SummaryCellTableViewCell.self, forCellReuseIdentifier: "SummaryCellTableViewCell")
//        sampleTableView?.delegate = self
        sampleTableView?.dataSource = self
        view.addSubview(sampleTableView ?? UITableView())
         addConstraints()
    }

    func addConstraints() {
        if let sampleTableView = sampleTableView{
            NSLayoutConstraint.activate([
                sampleTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                sampleTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20),
                sampleTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                sampleTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            ])
        }
    }
}

extension TableVIewVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = Sections.allCases[section]
        
        switch sectionType {
        case .details:
            return objAccountData?.count ?? 0
        case .summary:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = Sections.allCases[indexPath.section]
        switch sectionType{
        case .details:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BankAccountsCell") as? BankAccountsCell else {
                return UITableViewCell()
            }
            let account = objAccountData?[indexPath.row]
            cell.setAccountsDetails(account)
            
            return cell
        case .summary:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCellTableViewCell") as? SummaryCellTableViewCell else {
                return UITableViewCell()
            }
            cell.setDetails()
            
            return cell
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let eachSection = Sections.allCases[section]
        switch eachSection{
        case .details:
            return "Accounts"
        case .summary:
            return "Dashboard"
        }
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let sectionType = Sections.allCases[section]
//        
//        let headerView = UIView()
//        headerView.backgroundColor = .lightGray
//        
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .black
//        
//        headerView.addSubview(label)
//        
//        NSLayoutConstraint.activate([
//            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
//            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
//            label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
//            label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
//        ])
//        
//        switch sectionType {
//        case .details:
//            label.text = "Accounts"
//        case .summary:
//            label.text = "Dashboard"
//        }
//        
//        return headerView
//    }
}
//extension TableVIewVC: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //referencing the value
//        let selectedItem = selectionArray[indexPath.row]
//        selectedItem.isSelected.toggle()
//        selectedItem.value = selectedItem.isSelected ? "Mansi selected \(selectedItem.index+1)" : "\(selectedItem.index+1)"
//        self.sampleTableView?.reloadRows(at: [indexPath], with: .none)
//    }
//}





