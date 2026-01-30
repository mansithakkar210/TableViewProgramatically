//
//  AccountInfo.swift
//  TableViewProgramatically
//
//  Created by Mansi Thakkar on 2026-01-30.
//

import UIKit
struct AccountInfo{
    
    //MARK: Properties
    
    var accountIcon: String?
    var accountTitle: String?
    var accountNumber: String?
    var accountBalance: String?
    var accountIconColor: UIColor?
}

extension AccountInfo{
    
    //MARK: Getter Methods
    
    static func getMockData() -> [AccountInfo]{
        var objAccountSummaries: [AccountInfo] = []
        let a1 = AccountInfo(accountIcon: "indianrupeesign.bank.building", accountTitle: "Checking", accountNumber: "900-648-073", accountBalance: "$20,891.60", accountIconColor: .blue)
        let a2 = AccountInfo(accountIcon: "indianrupeesign.bank.building", accountTitle: "Savings", accountNumber: "547-089-001", accountBalance: "$4981.09", accountIconColor: .green)
        let a3 = AccountInfo(accountIcon: "creditcard", accountTitle: "Credit Card", accountNumber: "021-000-961", accountBalance: "508.99", accountIconColor: .red)
        let a4 = AccountInfo(accountIcon: "house", accountTitle: "Mortgage", accountNumber: "332-001-708", accountBalance: "$1,98,788", accountIconColor: .gray)
        objAccountSummaries.append(a1)
        objAccountSummaries.append(a2)
        objAccountSummaries.append(a3)
        objAccountSummaries.append(a4)
        return objAccountSummaries
    }
}
