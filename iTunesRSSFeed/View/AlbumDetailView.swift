//
//  AlbumDetailView.swift
//  iTunesRSSFeed
//
//  Created by Aiden Melendez on 4/16/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit

class AlbumDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup Functionality

    private func setupViews() {

// TODO: UI factory?
        let albumImage = UIImageView()

        let albumNameLabel = UILabel()
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.adjustsFontSizeToFitWidth = false
        albumNameLabel.textAlignment = .center
        albumNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        albumNameLabel.text = "Album Name"

        let artistLabel = UILabel()
        let genreLabel = UILabel()
        let releaseDateLabel = UILabel()
        let copyrightLabel = UILabel()

        let infoStack = UIStackView()
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        infoStack.axis = .vertical

        infoStack.addArrangedSubview(albumImage)
        infoStack.addArrangedSubview(albumNameLabel)
        infoStack.addArrangedSubview(artistLabel)
        infoStack.addArrangedSubview(genreLabel)
        infoStack.addArrangedSubview(releaseDateLabel)
        infoStack.addArrangedSubview(copyrightLabel)
    }
}
