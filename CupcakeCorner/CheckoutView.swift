//
//  Checkout.swift
//  CupcakeCorner
//
//  Created by JooMin Choi on 11/10/2022.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Checkout_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
