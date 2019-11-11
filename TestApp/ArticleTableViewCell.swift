//
//  ArticleTableViewCell.swift
//  TestApp
//
//  Created by Gourav on 28/12/18.
//  Copyright © 2018 gourav jaiswal. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageV: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ArticleTableViewCell {
    static let identifier = "ArticleTableViewCell"
}
