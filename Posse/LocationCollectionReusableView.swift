//
//  LocationCollectionReusableView.swift
//  Posse
//
//  Created by Matt Amerige on 4/10/17.
//  Copyright © 2017 Matt Amerige. All rights reserved.
//

import UIKit

class LocationCollectionReusableView: UICollectionReusableView {
    
    let textLabel = UILabel()
    let backgroundImageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(backgroundImageView)
        backgroundImageView.clipsToBounds = true
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.7
        
        textLabel.textColor = UIColor.white
        textLabel.font = UIFont(name: "LemonMilk", size: 20)
        
        addSubview(textLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
        // BackgroundImage covers full bounds
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        backgroundImageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
