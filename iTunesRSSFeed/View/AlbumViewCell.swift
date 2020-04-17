//
//  AlbumViewCell.swift
//  iTunesRSSFeed
//
//  Created by Aiden Melendez on 4/15/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit

class AlbumViewCell: UITableViewCell {
    
    let mainView: UIView = {
        let mainView = UIView(frame: .zero)
        mainView.backgroundColor = .gray
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    let albumNameLabel: UILabel = {
        let albumNameLabel = UILabel(frame: .zero)
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.adjustsFontSizeToFitWidth = false
        albumNameLabel.textAlignment = .center
        albumNameLabel.text = "Album name text"
        albumNameLabel.numberOfLines = 0
        return albumNameLabel
    }()
    
    let artistNameLabel: UILabel = {
        let artistNameLabel = UILabel(frame: .zero)
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.adjustsFontSizeToFitWidth = false
        artistNameLabel.textAlignment = .center
        artistNameLabel.text = "Artist name text"
        artistNameLabel.numberOfLines = 0
        return artistNameLabel
    }()
    
    let albumImage: UIImageView = {
        let albumImage = UIImageView(frame: .zero)
        albumImage.contentMode = .scaleAspectFit
        return albumImage
    }()
    
    let labelsStackView: UIStackView = {
        let labelsStackView = UIStackView()
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.axis = .vertical
        labelsStackView.distribution = .fillEqually
        labelsStackView.alignment = .center
        labelsStackView.spacing = 5
        return labelsStackView
    }()
    
    let contentStackView: UIStackView = {
        let contentStackView = UIStackView()
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.axis = .horizontal
        contentStackView.distribution = .fill
        contentStackView.alignment = .fill
        return contentStackView
    }()

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
        labelsStackView.addArrangedSubview(albumNameLabel)
        labelsStackView.addArrangedSubview(artistNameLabel)
        contentStackView.addArrangedSubview(albumImage)
        contentStackView.addArrangedSubview(labelsStackView)
        mainView.addSubview(contentStackView)
        self.contentView.addSubview(mainView)

        contentStackView.pin(to: mainView)
        mainView.pin(to: self.contentView)
        let squareConstraint = albumImage.widthAnchor.constraint(equalTo: albumImage.heightAnchor)
        squareConstraint.isActive = true
        squareConstraint.priority = .defaultLow
        albumImage.widthAnchor.constraint(equalTo: contentStackView.widthAnchor, multiplier: 0.25).isActive = true
        
        self.contentView.backgroundColor = .cyan
    }
}
