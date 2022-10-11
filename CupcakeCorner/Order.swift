//
//  Order.swift
//  CupcakeCorner
//
//  Created by JooMin Choi on 11/10/2022.
//

import Foundation

class Order: ObservableObject {
    static let types =
    ["Vanilla",
     "Strawberry",
     "Chocolate",
     "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var flatOrHouseNumber = ""
    @Published var streetAddress = ""
    @Published var townOrCity = ""
    @Published var county = ""
    @Published var postcode = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty ||
            flatOrHouseNumber.isEmpty ||
            streetAddress.isEmpty ||
            townOrCity.isEmpty ||
            postcode.isEmpty
        {
            return false
        }
        
        return true
    }
}
