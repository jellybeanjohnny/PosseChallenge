//
//  Store.swift
//  Posse
//
//  Created by Matt Amerige on 4/10/17.
//  Copyright © 2017 Matt Amerige. All rights reserved.
//

import Foundation

enum StoreError: LocalizedError {
    case JSONLoadingError
    case JSONParsingError
    
    var errorDescription: String? {
        switch self {
        case .JSONLoadingError:
            return "Unable to load JSON file."
            
        case .JSONParsingError:
            return "Unable to parse JSON file."
        }
    }
    
}

struct Store {
    //MARK: - Public
    func load(success: @escaping ([Location]) -> Void, failure: @escaping (Error) -> Void)  {
        DispatchQueue.global().async {
            guard let data = self.loadJSONData() else {
                DispatchQueue.main.async {
                    failure(StoreError.JSONLoadingError)
                }
                return
            }
           
            guard let locations = self.parseJSON(usingData: data) else {
                DispatchQueue.main.async {
                    failure(StoreError.JSONParsingError)
                }
                return
            }
            DispatchQueue.main.async {
                success(locations)
            }
        }
    }
    
    //MARK: - Private
    fileprivate func parseJSON(usingData: Data) -> [Location]? {
        let locations: [Location] = []
        return locations
    }
    
    
    fileprivate func loadJSONData() -> Data? {
        guard let fileURL = Bundle.main.url(forResource: "posse_challenge", withExtension: ".json") else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            return data
            
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
