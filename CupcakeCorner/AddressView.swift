//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by JooMin Choi on 11/10/2022.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Flat / House number", text: $order.flatOrHouseNumber)
                TextField("Street Address", text: $order.streetAddress)
                TextField("Town / City", text: $order.townOrCity)
                TextField("County",text: $order.county)
                TextField("Postcode", text: $order.postcode)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Checkout")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: Order())
        }
    }
}
