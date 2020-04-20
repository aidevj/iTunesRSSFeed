//
//  AlbumDetailsViewController.swift
//  iTunesRSSFeed
//
//  Created by Consultant on 4/16/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class AlbumDetailsViewController: UIViewController {
    
    enum Constants {
        static let margin: CGFloat = 20.0
        static let buttonHeight: CGFloat = 60.0
    }
    
    let albumNameLabel: UILabel = .simpleBoldLabel()
    let artistLabel: UILabel = .simpleBoldLabel()
    
    let albumImage: UIImageView = {
        let albumImage = UIImageView(frame: .zero)
        albumImage.contentMode = .scaleAspectFit
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        return albumImage
    }()
    
    let genreLabel: UILabel = .simpleBoldLabel()
    let releaseDateLabel: UILabel = .simpleBoldLabel()
    let copyrightLabel: UILabel = .simpleBoldLabel()
    let albumLinkoutButton: UIButton = {
        let albumLinkoutButton = UIButton(type: .custom)
        albumLinkoutButton.addTarget(self, action: #selector(openAlbumURL), for: .touchUpInside)
        albumLinkoutButton.translatesAutoresizingMaskIntoConstraints = false
        albumLinkoutButton.setTitle("View on iTunes", for: .normal)
        albumLinkoutButton.setTitleColor(.white, for: .normal)
        albumLinkoutButton.backgroundColor = albumLinkoutButton.tintColor
        return albumLinkoutButton
    }()
    
    let viewModel: AlbumViewModel
    
    init(viewModel: AlbumViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupViews()
        setupViewModel()
    }
    
    deinit {
        viewModel.unbind()
    }
    
    @objc func openAlbumURL() {
        guard let url = viewModel.url else { return }
        UIApplication.shared.open(url, options: [:])
    }
    
}

extension AlbumDetailsViewController {
    
    // MARK: Setup Functionality
    
    private func setupMainView() {
        view.backgroundColor = .white
        title = viewModel.name
    }
    
    private func setupViews() {
        addSubViewsHelper()
        setupConstraintsForLabels()
        setupConstraintsForButton()
    }

    private func setupViewModel() {
        viewModel.bindAndFire {
            DispatchQueue.main.async {
                self.albumNameLabel.text = self.viewModel.name
                self.artistLabel.text = self.viewModel.artistName
                self.viewModel.image { (data) in
                    self.albumImage.setDataOrNil(data)
                }
                self.genreLabel.text = self.viewModel.genre
                self.releaseDateLabel.text = self.viewModel.releaseDate
                self.copyrightLabel.text = self.viewModel.copyright
                self.view.layoutIfNeeded()
            }
        }
    }
    
}

extension AlbumDetailsViewController {
    
    private func addSubViewsHelper() {
        view.addSubview(albumNameLabel)
        view.addSubview(artistLabel)
        view.addSubview(albumImage)
        view.addSubview(genreLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(copyrightLabel)
        view.addSubview(albumLinkoutButton)
    }
    
    private func setupConstraintsForLabels() {
        let margin = Constants.margin
        albumNameLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,
                                            constant: margin).isActive = true
        albumNameLabel.pinLeadingAndTrailing(to: view, margin: margin)
        albumNameLabel.bottomAnchor.constraint(equalTo: artistLabel.topAnchor,
                                               constant: -margin).isActive = true
        
        artistLabel.pinLeadingAndTrailing(to: view, margin: margin)
        setupConstraintsForImageView()
        
        genreLabel.pinLeadingAndTrailing(to: view, margin: margin)
        genreLabel.bottomAnchor.constraint(equalTo: releaseDateLabel.topAnchor,
                                           constant: -margin).isActive = true
        
        releaseDateLabel.pinLeadingAndTrailing(to: view, margin: margin)
        releaseDateLabel.bottomAnchor.constraint(equalTo: copyrightLabel.topAnchor,
                                                 constant: -margin).isActive = true
        
        copyrightLabel.pinLeadingAndTrailing(to: view, margin: margin)
        copyrightLabel.bottomAnchor.constraint(equalTo: albumLinkoutButton.topAnchor,
                                               constant: -margin).isActive = true
 
    }
    
    private func setupConstraintsForImageView() {
        let margin = Constants.margin
        artistLabel.bottomAnchor.constraint(equalTo: albumImage.topAnchor,
                                            constant: -margin).isActive = true
        albumImage.pinLeadingAndTrailing(to: view, margin: margin)
        albumImage.bottomAnchor.constraint(equalTo: genreLabel.topAnchor, constant: -margin).isActive = true
    }
    
    private func setupConstraintsForButton() {
        let margin = Constants.margin
        albumLinkoutButton.pinLeadingAndTrailing(to: view, margin: margin)
        albumLinkoutButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor,
                                                   constant: -margin).isActive = true
        albumLinkoutButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true
    }
    
}
