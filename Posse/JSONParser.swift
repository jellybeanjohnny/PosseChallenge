//
//  JSONParser.swift
//  Posse
//
//  Created by Matt Amerige on 4/10/17.
//  Copyright © 2017 Matt Amerige. All rights reserved.
//

import Foundation
import SwiftyJSON

struct JSONParser {
    
    func parseJSON(usingData data: Data) -> [Location]? {
        
        var locations: [Location] = []
        
        let json = JSON(data)
        let locationsJSONArray = json["response"]["locations"].arrayValue
        

        for locationJSON in locationsJSONArray {
            var programmers: [Programmer] = []
            let serviceJSONArray = locationJSON["services"].arrayValue
            for serviceJSON in serviceJSONArray {
                let programmerJSONArray = serviceJSON["programmers"].arrayValue
                for programmerJSON in programmerJSONArray {
                    let platform = serviceJSON["platform"].stringValue
                    let programmer = parseProgrammer(json: programmerJSON, platform: platform)
                    programmers.append(programmer)
                }
            }
            let location = parseLocation(json: locationJSON, programmers: programmers)
            locations.append(location)
        }
        
        return locations
    }
    
    fileprivate func parseProgrammer(json: JSON, platform: String) -> Programmer {
        let name = json["name"].stringValue
        let favoriteColor = json["favorite_color"].stringValue
        let age = json["age"].intValue
        let weight = json["weight"].floatValue
        let phoneNumber = json["phone"].stringValue
        let isArtist = json["is_artist"].boolValue
        let programmer = Programmer(name: name, favoriteColor: favoriteColor, age: age, weight: weight, phoneNumber: phoneNumber, isArtist: isArtist, platform: platform)
        return programmer
    }
    
    fileprivate func parseLocation(json: JSON, programmers: [Programmer]) -> Location {
        let locality = json["locality"].stringValue
        let region = json["region"].stringValue
        let location = Location(locality: locality, region: region, programmers: programmers)
        return location
    }
}
