//
//  AlbumViewCell.swift
//  iTunesRSSFeed
//
//  Created by Aiden Melendez on 4/15/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit

class AlbumViewCell: UITableViewCell {

    static let identifier = "AlbumViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Set up main view for cell
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 90))
        mainView.backgroundColor = .gray

        let albumImage = UIImageView(frame: CGRect(x: 5, y: 5, width: 65, height: 65))

        let albumNameLabel = UILabel(frame: .zero)
        albumNameLabel.textAlignment = .left
        albumNameLabel.text = "Album name text"

        let artistNameLabel = UILabel(frame: .zero)
        artistNameLabel.textAlignment = .left
        artistNameLabel.text = "Artist name text"

        let labelsStackView = UIStackView()
        labelsStackView.axis = .vertical
        labelsStackView.distribution = .equalSpacing
        labelsStackView.alignment = .center
        labelsStackView.spacing = 5
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false

        labelsStackView.addArrangedSubview(albumNameLabel)
        labelsStackView.addArrangedSubview(artistNameLabel)

        let contentStackView = UIStackView()
        contentStackView.axis = .horizontal
        contentStackView.distribution = .fillEqually
        contentStackView.alignment = .trailing
        contentStackView.translatesAutoresizingMaskIntoConstraints = false

        contentStackView.addArrangedSubview(albumImage)
        contentStackView.addArrangedSubview(labelsStackView)

        //TODO: Set Constraints

        self.contentView.backgroundColor = .cyan

        // Add subviews
        mainView.addSubview(contentStackView)
        self.contentView.addSubview(mainView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
