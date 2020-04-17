//
//  ViewController.swift
//  iTunesRSSFeed
//
//  Created by Aiden Melendez on 4/14/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit

class RSSFeedViewController: UIViewController {

    var tableView = UITableView()
    var viewModel: RSSFeedViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iTunes RSS Feed: Top 100"
        setupMainView()
        setupTableView()
        setTableViewDelegates()
    }

    init(viewModel: RSSFeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailViewController", bundle: .main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupMainView() {
        view.backgroundColor = .white
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 100

        tableView.register(AlbumViewCell.self,
                           forCellReuseIdentifier: AlbumViewCell.identifier)
        tableView.pin(to: view)
    }

    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension RSSFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
        //return viewModel.albums.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumViewCell.identifier, for: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let url = viewModel.url(for: indexPath.row) else { return }
//        UIApplication.shared.open(url, options: [:])
    }
}
