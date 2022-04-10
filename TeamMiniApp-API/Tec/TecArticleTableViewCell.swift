//
//  TecArticleTableViewCell.swift
//  TeamMiniApp-API
//
//  Created by 近藤米功 on 2022/04/09.
//

import UIKit

class TecArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
