//
//  NutritionFacts.swift
//  DigitalNutritionFacts
//
//  Created by Ian Leon on 1/3/21.
//

import Foundation

extension Double {

    func converted<T:Dimension>(fromUnit: T, to toUnit: T) -> Double {
        return Measurement(value: self, unit: fromUnit)
            .converted(to: toUnit).value
    }

    func toGrams(from fromUnit: UnitMass) -> Double {
        return self.converted(fromUnit: fromUnit, to: .grams)
    }
    
    func toMilliliters(from fromUnit: UnitVolume) -> Double {
        return self.converted(fromUnit: fromUnit, to: .milliliters)
    }
    
    func toMeasurement<T:Unit>(withUnit: T) -> Measurement<T> {
        return Measurement(value: self, unit: withUnit)
    }
}

struct Mass {
    
    let grams: Double
    
    init(g: Double) {
        grams = g
    }
    
    // MARK: - Convenience initializers
    
    init(mg milligrams: Double) {
        self.init(g: milligrams.toGrams(from: .milligrams))
    }
    init(mcg micrograms: Double) {
        self.init(g: micrograms.toGrams(from: .micrograms))
    }
    
    // MARK: - Custom operators
    
    static func +(lhs: Mass, rhs: Mass) -> Mass {
        Mass(g: lhs.grams + rhs.grams)
    }
    
    // MARK: - Formatters
    
    static let formatter = MassFormatter()
    
    func formatted() -> String {
        
        return Mass.formatter.string(fromValue: grams, unit: .gram)
    }
}

struct Volume {
    
    let milliliter: Double
    
    init(mL: Double) {
        milliliter = mL
    }
    
    // MARK: - Convenience initializers
    
    init(cups: Double) {
        self.init(mL: cups.converted(fromUnit: UnitVolume.cups, to: .milliliters))
    }
    
    // MARK: - Formatters
    
    static var formatter:MeasurementFormatter = {
        let mf = MeasurementFormatter()
        mf.unitOptions = .naturalScale
        mf.numberFormatter.maximumFractionDigits = 2
        return mf
    }()
    
    func formatted() -> String {
        
        return Volume.formatter.string(from: milliliter.toMeasurement(withUnit: UnitVolume.milliliters))
    }
    
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



