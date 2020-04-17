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
        setupViews()
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

    // MARK: - Setup Functionality
    private func setupViews() {
        
        // Set up main view for cell
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 90))
        mainView.backgroundColor = .gray
        mainView.translatesAutoresizingMaskIntoConstraints = false
        // Todo: add constraints after adding subview
//        mainView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
//        mainView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
//        mainView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
//        mainView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true

        let albumImage = UIImageView(frame: CGRect(x: 5, y: 5, width: 65, height: 65))

        let albumNameLabel = UILabel(frame: .zero)
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.adjustsFontSizeToFitWidth = false
        albumNameLabel.textAlignment = .left
        albumNameLabel.text = "Album name text"

        let artistNameLabel = UILabel(frame: .zero)
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.adjustsFontSizeToFitWidth = false
        artistNameLabel.textAlignment = .left
        artistNameLabel.text = "Artist name text"

        let labelsStackView = UIStackView()
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.axis = .vertical
        labelsStackView.distribution = .equalSpacing
        labelsStackView.alignment = .center
        labelsStackView.spacing = 5

        labelsStackView.addArrangedSubview(albumNameLabel)
        labelsStackView.addArrangedSubview(artistNameLabel)

        let contentStackView = UIStackView()
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.axis = .horizontal
        contentStackView.distribution = .fillEqually
        contentStackView.alignment = .trailing

        contentStackView.addArrangedSubview(albumImage)
        contentStackView.addArrangedSubview(labelsStackView)

        //TODO: Set Constraints

        self.contentView.backgroundColor = .cyan

        // Add subviews
        mainView.addSubview(contentStackView)
        self.contentView.addSubview(mainView)
    }
}
