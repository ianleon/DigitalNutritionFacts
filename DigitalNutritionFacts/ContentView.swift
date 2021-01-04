//
//  ContentView.swift
//  DigitalNutritionFacts
//
//  Created by Ian Leon on 1/3/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(Volume(cups: 30).formatted())
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
