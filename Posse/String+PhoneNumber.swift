//
//  String+PhoneNumber.swift
//  Posse
//
//  Created by Matt Amerige on 4/10/17.
//  Copyright © 2017 Matt Amerige. All rights reserved.
//

import Foundation

extension String {
    
    /// Formats a string into a phone number format like 123.456.7890.
    /// Expects the number to contain 10 digits with no other characters
    var phoneNumberFormat: String {
        var phoneNumberString = self
        phoneNumberString.insert(".", at: self.index(startIndex, offsetBy: 3))
        phoneNumberString.insert(".", at: self.index(startIndex, offsetBy: 7))
        return phoneNumberString
    }
}
