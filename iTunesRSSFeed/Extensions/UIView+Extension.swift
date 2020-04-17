//
//  UIView+Extension.swift
//  iTunesRSSFeed
//
//  Created by Consultant on 4/15/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

extension UIView {
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.layoutMarginsGuide.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.layoutMarginsGuide.bottomAnchor).isActive = true
    }
}

extension UIImageView {
    func setOnMain(_ image: UIImage?) {
        DispatchQueue.main.async {
            self.image = image
        }
    }
}
