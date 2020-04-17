//
//  AlbumDetailsViewController.swift
//  iTunesRSSFeed
//
//  Created by Consultant on 4/16/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class AlbumDetailsViewController: UIViewController {

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
        openAlbumURL()
    }
    
    func openAlbumURL() {
        guard let url = viewModel.url else { return }
        UIApplication.shared.open(url, options: [:])
    }
}
