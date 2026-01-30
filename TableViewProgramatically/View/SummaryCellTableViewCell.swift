//
//  SummaryCellTableViewCell.swift
//  TableViewProgramatically
//
//  Created by Mansi Thakkar on 2026-01-30.
//

import UIKit

class SummaryCellTableViewCell: UITableViewCell {
    
    var icon: UIImageView?
    var header: UILabel?
    var headerDescription: UILabel?
    
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

        // Configure the view for the selected state
    }
    
    func setupUI(){
        
        //MARK: UI SetUp method
        
        icon = UIImageView()
        icon?.translatesAutoresizingMaskIntoConstraints = false
        
        header = UILabel()
        header?.textAlignment = .left
        header?.textColor = .black
        header?.translatesAutoresizingMaskIntoConstraints = false
        
        headerDescription = UILabel()
        headerDescription?.textAlignment = .left
        headerDescription?.textColor = .black
        headerDescription?.translatesAutoresizingMaskIntoConstraints = false
        
        
        if let icon = icon, let header = header, let headerDescription = headerDescription{
            
                //Adding subviews into view
                contentView.addSubview(icon)
                contentView.addSubview(header)
                contentView.addSubview(headerDescription)
            
                NSLayoutConstraint.activate([
                    //Adding constraints for banner image
                    icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                    icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
                    icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                    icon.widthAnchor.constraint(equalToConstant: 70),
                    icon.heightAnchor.constraint(equalToConstant: 70),
                
                    //Adding constraints for movie title
                    header.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                    header.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
                    header.widthAnchor.constraint(equalToConstant: 120),
                    header.heightAnchor.constraint(equalToConstant: 30),
                    header.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
//                    accountTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                
                    //Adding constraints for popularity score
                    headerDescription.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 5),
                    headerDescription.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
                    headerDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
//                    accountNumber.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                
            ])
        }
    }
}

extension SummaryCellTableViewCell{
        
        // MARK: Setter Methods
        
        func setDetails(){
            icon?.image = UIImage(systemName:"gift.fill")
            icon?.tintColor = .systemOrange
            header?.text = "Upgrade with Pro"
            header?.font = UIFont.systemFont(ofSize: 20)
            headerDescription?.text = "Level up your banking experience with pro"
            headerDescription?.numberOfLines = 0
            headerDescription?.textAlignment = .left
        }
    }
