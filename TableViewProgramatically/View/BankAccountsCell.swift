//
//  MovieSummaryTabelViewCellTableViewCell.swift
//  TableViewProgramatically
//
//  Created by Mansi Thakkar on 2026-01-28.
//

import UIKit

class BankAccountsCell: UITableViewCell {
        
      var accountIcon: UIImageView?
      var accountTitle: UILabel?
      var accountNumber: UILabel?
      var accountBalance: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupUI(){
        
        //MARK: UI SetUp method
        
        accountIcon = UIImageView()
        accountIcon?.translatesAutoresizingMaskIntoConstraints = false
        
        accountTitle = UILabel()
        accountTitle?.textAlignment = .left
        accountTitle?.textColor = .black
        accountTitle?.translatesAutoresizingMaskIntoConstraints = false
        
        accountNumber = UILabel()
        accountNumber?.textAlignment = .left
        accountNumber?.textColor = .black
        accountNumber?.translatesAutoresizingMaskIntoConstraints = false
        
        accountBalance = UILabel()
        accountBalance?.textAlignment = .right
        accountBalance?.textColor = .black
        accountBalance?.translatesAutoresizingMaskIntoConstraints = false
        
        if let accountIcon = accountIcon, let accountTitle = accountTitle, let accountNumber = accountNumber, let accountBalance = accountBalance{
            
                //Adding subviews into view
                contentView.addSubview(accountIcon)
                contentView.addSubview(accountTitle)
                contentView.addSubview(accountNumber)
                contentView.addSubview(accountBalance)
            
                NSLayoutConstraint.activate([
                    //Adding constraints for banner image
                    accountIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                    accountIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
                    accountIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                    accountIcon.widthAnchor.constraint(equalToConstant: 70),
                    accountIcon.heightAnchor.constraint(equalToConstant: 70),
                
                    //Adding constraints for movie title
                    accountTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                    accountTitle.leadingAnchor.constraint(equalTo: accountIcon.trailingAnchor, constant: 5),
                    accountTitle.widthAnchor.constraint(equalToConstant: 120),
                    accountTitle.heightAnchor.constraint(equalToConstant: 30),
//                    accountTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                
                    //Adding constraints for popularity score
                    accountNumber.topAnchor.constraint(equalTo: accountTitle.bottomAnchor, constant: 5),
                    accountNumber.leadingAnchor.constraint(equalTo: accountIcon.trailingAnchor, constant: 5),
//                    accountNumber.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                
                    //Adding constraints for release year
//                    accountBalance.topAnchor.constraint(equalTo: accountNumber.bottomAnchor, constant: 20),
                    accountBalance.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
//                    accountBalance.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                    accountBalance.leadingAnchor.constraint(equalTo: accountTitle.trailingAnchor, constant: 5),
//                    accountBalance.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -15),
                    accountBalance.widthAnchor.constraint(equalToConstant: 120),
                    accountBalance.heightAnchor.constraint(equalToConstant: 30),
            ])
        }
    }
}
extension BankAccountsCell{
        
        // MARK: Setter Methods
        
        func setAccountsDetails(_ accountInfo : AccountInfo?){
            accountIcon?.image = UIImage(systemName: accountInfo?.accountIcon ?? "popcorn.fill")
            accountIcon?.tintColor = accountInfo?.accountIconColor ?? .red
            accountTitle?.text = accountInfo?.accountTitle ?? ""
            accountBalance?.text = accountInfo?.accountBalance ?? ""
            accountNumber?.text = accountInfo?.accountNumber ?? ""
        }
    }
