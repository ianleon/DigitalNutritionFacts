//
//  NutritionFacts.swift
//  DigitalNutritionFacts
//
//  Created by Ian Leon on 1/3/21.
//

import Foundation


struct Mass {
    
    let grams: Double
    
    init(g: Double) {
        grams = g
    }
    
    // MARK: - Convenience initializers
    
    init(mg milligrams: Double) {
        self.init(g: milligrams / 1e3)
    }
    init(mcg micrograms: Double) {
        self.init(g: micrograms / 1e6)
    }
    
    // MARK: - Custom operators
    
    static func +(lhs: Mass, rhs: Mass) -> Mass {
        Mass(g: lhs.grams + rhs.grams)
    }
    
    // TODO there is a MassFormatter (see what that does) is there a volume formatter?
}

struct Volume {
    let liters: Double
    // TODO convenience initializers in cups
}

struct NutritionFacts {
    
    let servingsPerContainer: Int
    
    struct ServingSize {
        let volume: Volume
        let mass: Mass
    }
    
    let servingSize: ServingSize
    
    let calories: Int
    
    struct Fat {
        let saturatedFat: Mass
        let transFat: Mass
        var totalFat:Mass {
            saturatedFat + transFat
        }
    }
    
    let fat: Fat
    
    let cholesterol: Mass
    let sodium: Mass
    
    
    struct Carbohydrate {
        
        let dietaryFiber: Mass
        
        struct Sugars {
            
            let nonAddedSugars:Mass
            let addedSugars: Mass
            
            var totalSugars: Mass {
                addedSugars + nonAddedSugars
            }
        }
        
        let sugars: Sugars
    }
    
    let carbohydrate: Carbohydrate
    
    let protein: Mass
    
    struct Macronutrients {
        let vitaminD: Mass
        let calcium: Mass
        let iron: Mass
        let potassium: Mass
    }
    
    let macronutrients: Macronutrients
}



