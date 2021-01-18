//
//  NutritionFacts.swift
//  DigitalNutritionFacts
//
//  Created by Ian Leon on 1/3/21.
//

import Foundation

struct ServingSize: Codable {
    
    let volume: Volume
    let mass: Mass
}

struct Fat: Codable {
    
    let saturatedFat: Mass
    let transFat: Mass
    
    var totalFat:Mass {
        saturatedFat + transFat
    }
}
struct Sugars: Codable {
    
    let nonAddedSugars:Mass
    let addedSugars: Mass
    
    var totalSugars: Mass {
        addedSugars + nonAddedSugars
    }
}
struct Carbohydrate: Codable {
    
    let dietaryFiber: Mass
    let sugars: Sugars
}

struct Macronutrients: Codable {
    
    let vitaminD: Mass
    let calcium: Mass
    let iron: Mass
    let potassium: Mass
}
struct NutritionFacts: Codable {
    
    let servingsPerContainer: Ct
    let servingSize: ServingSize
    let calories: Cal
    let fat: Fat
    let cholesterol: Mass
    let sodium: Mass
    let carbohydrate: Carbohydrate
    let protein: Mass
    let macronutrients: Macronutrients
}
