//
//  Order.swift
//  CupcakeCorner
//
//  Created by JooMin Choi on 11/10/2022.
//

import Foundation

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case type,
             quantity,
             extraFrosting,
             addSprinkles,
             name,
             flatOrHouseNumber,
             streetAddress,
             townOrCity,
             county,
             postcode
    }
    
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
    
    var cost: Double {
        var cost = Double(quantity) * 2
        
        cost += (Double(type) / 2)
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    init() { }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(flatOrHouseNumber, forKey: .flatOrHouseNumber)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(townOrCity, forKey: .townOrCity)
        try container.encode(county, forKey: .county)
        try container.encode(postcode, forKey: .postcode)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        
        name = try container.decode(String.self, forKey: .name)
        flatOrHouseNumber = try container.decode(String.self, forKey: .flatOrHouseNumber)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        townOrCity = try container.decode(String.self, forKey: .townOrCity)
        county = try container.decode(String.self, forKey: .county)
        postcode = try container.decode(String.self, forKey: .postcode)
    }
}
