//
//  DisplayViewController.swift
//  Posse
//
//  Created by Matt Amerige on 4/10/17.
//  Copyright © 2017 Matt Amerige. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    var locations: [Location] = []
    
    let headerImages = [
        UIImage(named: "nyc.jpg"),
        UIImage(named: "chicago.jpg"),
        UIImage(named: "oakland.jpg")
    ]
    
    var collectionView: UICollectionView!
    
    // Cell & Column Spacing
    let numberOfColumns: CGFloat = 2
    let cellSpacing: CGFloat = 1
    var totalSpacing: CGFloat {
        return numberOfColumns + 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupCollectionView()
        loadData()
    }
    
    struct CellIdentifier {
        static let locationHeader = "locationHeader"
        static let programmerCell = "programmerCell"
    }
    
    func loadData() {
        let store = Store()
        store.load(success: { (locations) in
            
            self.locations = locations
            self.collectionView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = calculateCellSize()
        flowLayout.headerReferenceSize = calculateHeaderSize()
        flowLayout.minimumLineSpacing = cellSpacing
        flowLayout.minimumInteritemSpacing = cellSpacing
        
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: cellSpacing)
        collectionView.backgroundColor = UIColor.black
        
        registerCells()
        
        view.addSubview(collectionView)
        createConstraints()
    }
    
    func createConstraints() {
        // The collection view fills the entire screen
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func registerCells() {
        collectionView.register(LocationCollectionReusableView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: CellIdentifier.locationHeader)
        collectionView.register(ProgrammerCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier.programmerCell)
    }
    
    func calculateCellSize() -> CGSize {
        let cellWidthAndHeight = (view.bounds.size.width - (cellSpacing * totalSpacing)) / numberOfColumns
        return CGSize(width: cellWidthAndHeight, height: cellWidthAndHeight)
    }
    
    func calculateHeaderSize() -> CGSize {
        let width = view.bounds.width
        let height: CGFloat = calculateCellSize().height / 2
        return CGSize(width: width, height: height)
    }
    
}

extension DisplayViewController: UICollectionViewDelegate {
    
}

extension DisplayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let location = locations[section]
        return location.programmers.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return locations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard var cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.programmerCell, for: indexPath) as? ProgrammerCollectionViewCell else {
            return UICollectionViewCell()
        }
    
        cell = configured(cell: cell, forItemAtIndexPath: indexPath)

        return cell
    }
    
    func configured(cell: ProgrammerCollectionViewCell, forItemAtIndexPath indexPath: IndexPath) -> ProgrammerCollectionViewCell {
        let programmer = locations[indexPath.section].programmers[indexPath.row]
        
        // Set the appropriate platform image
        if programmer.platform == "iOS" {
            cell.platformImageView.image = UIImage(named: "iOS")
        } else if programmer.platform == "Android" {
            cell.platformImageView.image = UIImage(named: "android")
        } else if programmer.platform == "Ruby" {
            cell.platformImageView.image = UIImage(named: "ruby")
        }
        
        cell.nameLabel.text = programmer.name
        cell.ageLabel.text = "\(programmer.age) years old"
        cell.weightLabel.text = "\(programmer.weight) lbs"
        cell.artistLabel.text = programmer.isArtist ? "I can draw stuff" : "I can't draw stuff"
        cell.favoriteColorLabel.text = "I love \(programmer.favoriteColor)"
        cell.phoneLabel.text = programmer.phoneNumber.phoneNumberFormat
        
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: CellIdentifier.locationHeader, for: indexPath) as? LocationCollectionReusableView else {
            return UICollectionReusableView()
        }
        
        header.backgroundImageView.image = headerImages[indexPath.section]
        
        let location = locations[indexPath.section]
        header.textLabel.text = "\(location.locality), \(location.region)"
        
        return header
    }
}
