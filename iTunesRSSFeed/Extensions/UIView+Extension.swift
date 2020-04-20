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
        topAnchor.constraint(equalTo: superView.layoutMarginsGuide.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    
    func pinLeadingAndTrailing(to view: UIView, margin: CGFloat = 0.0) {
        leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                 constant: margin).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                  constant: -margin).isActive = true
    }
}

extension UILabel {
    class func simpleLabel() -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }
    
    class func simpleBoldLabel() -> UILabel {
        let label = simpleLabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }
}

extension UIImageView {
    func setOnMain(_ image: UIImage?) {
        DispatchQueue.main.async {
            self.image = image
        }
    }
    func setDataOrNil(_ dataOrNil: Data?) {
        var image: UIImage?
        defer {
            setOnMain(image)
        }
        guard let data = dataOrNil else { return }
        image = UIImage(data: data)
    }
}

extension UIImage {

    func scaledImage(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, .zero)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
    
}
