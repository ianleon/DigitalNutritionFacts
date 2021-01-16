//
//  Double+Measurement.swift
//  DigitalNutritionFacts
//
//  Created by Ian Leon on 1/16/21.
//

import Foundation
extension Double {
    var g: Mass {
        .init(value: self, unit: .grams)
    }
    var mg: Mass {
        .init(value: self, unit: .milligrams)
    }
    var l: Volume {
        .init(value: self, unit: .liters)
    }
    var mL: Volume {
     
        .init(value: self, unit: .milliliters)
    }
}
