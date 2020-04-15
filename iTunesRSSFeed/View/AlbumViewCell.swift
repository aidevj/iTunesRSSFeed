//
//  AlbumViewCell.swift
//  iTunesRSSFeed
//
//  Created by Consultant on 4/15/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class AlbumViewCell: UITableViewCell {

    static let identifier = "AlbumViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 75))
        backgroundColor = .blue
        mainView.backgroundColor = .red
        self.contentView.backgroundColor = .cyan
        self.contentView.addSubview(mainView)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
