//
//  ProgrammerCollectionViewCell.swift
//  Posse
//
//  Created by Matt Amerige on 4/10/17.
//  Copyright © 2017 Matt Amerige. All rights reserved.
//

import UIKit

class ProgrammerCollectionViewCell: UICollectionViewCell {
    
    let textLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.lightGray
        addSubview(textLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        textLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
}
