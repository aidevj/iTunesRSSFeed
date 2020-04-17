//
//  ViewController.swift
//  iTunesRSSFeed
//
//  Created by Aiden Melendez on 4/14/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit

class RSSFeedViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        view.addSubview(tableView)
        tableView.register(AlbumViewCell.self,
                           forCellReuseIdentifier: AlbumViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    let viewModel: RSSFeedViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupTableView()
        setupViewModel()
        fetchData()
    }

    init(viewModel: RSSFeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupMainView() {
        view.backgroundColor = .white
        title = "iTunes RSS Feed: Top 100"
    }
    
    private func setupTableView() {
        tableView.pin(to: view)
    }
    
    private func setupViewModel() {
        viewModel.bind {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func fetchData() {
        viewModel.getFeed()
    }

}

extension RSSFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueAlbumViewCell(for: indexPath)
        let row = indexPath.row
        viewModel.image(for: row) { (data) in
            var image: UIImage?
            defer {
                cell.albumImage.setOnMain(image)
            }
            guard let data = data else { return }
            image = UIImage(data: data)
        }
        cell.albumNameLabel.text = viewModel.name(for: row)
        cell.artistNameLabel.text = viewModel.artistName(for: row)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let albumViewModel = viewModel.makeAlbumViewModel(for: indexPath.row) else { return }
        let detailsViewController = AlbumDetailsViewController(viewModel: albumViewModel)
        present(detailsViewController, animated: true)
    }
}

extension RSSFeedViewController {
    func dequeueAlbumViewCell(for indexPath: IndexPath) -> AlbumViewCell {
        let identifier = AlbumViewCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                       for: indexPath) as? AlbumViewCell else {
            fatalError("Cell of type \"AlbumViewCell\" was dequeued before registering")
        }
        return cell
    }
}
