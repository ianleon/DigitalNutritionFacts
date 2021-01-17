//
//  ContentView.swift
//  DigitalNutritionFacts
//
//  Created by Ian Leon on 1/3/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let n = NutritionFacts(
            servingsPerContainer: 1,
            servingSize: ServingSize(
                volume: 400.mL,
                mass: 200.g
            ),
            calories: 300,
            fat: Fat(
                saturatedFat: 300.g,
                transFat: 200.mg
            ),
            cholesterol: 12.3.g,
            sodium: 2.g,
            carbohydrate: .init(
                dietaryFiber: 100.g,
                sugars: .init(
                    nonAddedSugars: 100.g,
                    addedSugars: 200.g
                )
            ),
            protein: 3.g,
            macronutrients: .init(
                vitaminD: 400.mg,
                calcium: 400.mg,
                iron: 400.mg,
                potassium: 200.mg
            )
        )
        
        return VStack {
            Text(400.g.short)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
