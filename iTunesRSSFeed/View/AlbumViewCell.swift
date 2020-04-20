//
//  AlbumViewCell.swift
//  iTunesRSSFeed
//
//  Created by Aiden Melendez on 4/15/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit

class AlbumViewCell: UITableViewCell {
    
    enum Constants {
        static let margin: CGFloat = 20.0
        static let widthRatio: CGFloat = 0.25
    }
    
    let mainView: UIView = {
        let mainView = UIView(frame: .zero)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    let albumNameLabel: UILabel = .simpleLabel()
    
    let artistNameLabel: UILabel = .simpleLabel()
    
    let albumImage: UIImageView = {
        let albumImage = UIImageView(frame: .zero)
        albumImage.contentMode = .scaleAspectFit
        albumImage.translatesAutoresizingMaskIntoConstraints = false
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

    static let identifier = "AlbumViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension AlbumViewCell {

    // MARK: - Setup Functionality
    private func setupViews() {
        labelsStackView.addArrangedSubview(albumNameLabel)
        labelsStackView.addArrangedSubview(artistNameLabel)
        mainView.addSubview(albumImage)
        mainView.addSubview(labelsStackView)
        self.contentView.addSubview(mainView)
        mainView.pin(to: self.contentView)
        
        let margin = Constants.margin
        albumImage.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        albumImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: margin).isActive = true
        albumImage.trailingAnchor.constraint(equalTo: labelsStackView.leadingAnchor, constant: -margin).isActive = true
        albumImage.bottomAnchor.constraint(lessThanOrEqualTo: mainView.bottomAnchor).isActive = true
        albumImage.widthAnchor.constraint(equalTo: mainView.widthAnchor,
                                          multiplier: Constants.widthRatio).isActive = true
        albumImage.widthAnchor.constraint(equalTo: albumImage.heightAnchor).isActive = true
        labelsStackView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        labelsStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -margin).isActive = true
        labelsStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        
    }
}
