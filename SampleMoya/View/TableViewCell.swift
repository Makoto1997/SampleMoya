//
//  TableViewCell.swift
//  SampleMoya
//
//  Created by Makoto on 2022/05/01.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    static var className: String { String(describing: TableViewCell.self)}
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
    }
    
    func configure(gitHubModel: GitHubModel) {
        
        titleLabel.text = gitHubModel.fullName
    }
}
