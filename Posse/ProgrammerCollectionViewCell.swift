//
//  ProgrammerCollectionViewCell.swift
//  Posse
//
//  Created by Matt Amerige on 4/10/17.
//  Copyright © 2017 Matt Amerige. All rights reserved.
//

import UIKit

class ProgrammerCollectionViewCell: UICollectionViewCell {
    
    let nameLabel = UILabel()
    let ageLabel = UILabel()
    let weightLabel = UILabel()
    let phoneLabel = UILabel()
    let platformImageView = UIImageView()
    let favoriteColorLabel = UILabel()
    let artistLabel = UILabel()
    
    fileprivate let textColor = UIColor.white
    fileprivate let font = UIFont(name: "Verdana", size: 16)
    
    fileprivate let darkView = UIView()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor(netHex: 0x4A5259)
        setupSubViews()
        setupConstraints()
    }
    
    func setupSubViews() {
        
        addSubview(platformImageView)
    
        darkView.backgroundColor = UIColor.black
        darkView.alpha = 0.6
        addSubview(darkView)
    
        ageLabel.textColor = textColor
        ageLabel.font = font
        addSubview(ageLabel)
        
        nameLabel.textColor = textColor
        nameLabel.font = UIFont(name: "Verdana-Bold", size: 18)
        addSubview(nameLabel)
        
        weightLabel.textColor = textColor
        weightLabel.font = font
        addSubview(weightLabel)
        
        phoneLabel.textColor = textColor
        phoneLabel.font = font
        addSubview(phoneLabel)
        
        favoriteColorLabel.textColor = textColor
        favoriteColorLabel.font = font
        addSubview(favoriteColorLabel)
        
        artistLabel.textColor = textColor
        artistLabel.font = font
        addSubview(artistLabel)
    }
    
    func setupConstraints() {
        
        
       
        // Platform image takes up entire cell and is below all other subviews
        platformImageView.translatesAutoresizingMaskIntoConstraints = false
        platformImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        platformImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        platformImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        platformImageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        // Dark View
        darkView.translatesAutoresizingMaskIntoConstraints = false
        darkView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        darkView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        darkView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        darkView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        // Name is at the top of the cell
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        // Age is 10 points below name
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        
        // Weight is 10 points below age
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        weightLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 10).isActive = true
        
        // Favorite Color is 10 points below weight
        favoriteColorLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteColorLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 10).isActive = true
        favoriteColorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        // artist label is 10 points below color
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.topAnchor.constraint(equalTo: favoriteColorLabel.bottomAnchor, constant: 10).isActive = true
        artistLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        // Phone is centered on the bottom
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        phoneLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
}
