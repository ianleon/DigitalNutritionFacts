//
//  Int+Measurement.swift
//  DigitalNutritionFacts
//
//  Created by Ian Leon on 1/16/21.
//

import Foundation
extension Int {
    var g: Mass { Double(self).g }
    var mg: Mass { Double(self).mg }
    var l: Volume { Double(self).l }
    var mL: Volume { Double(self).mL }
}
