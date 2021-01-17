//
//  MeasurementFormatter.swift
//  DigitalNutritionFacts
//
//  Created by Ian Leon on 1/16/21.
//

import Foundation

extension MeasurementFormatter {
    static var short:MeasurementFormatter = {
        var shortFormatter = MeasurementFormatter()
        shortFormatter.unitOptions = .providedUnit
        shortFormatter.unitStyle = .short
        return shortFormatter
    }()
}

extension Measurement {
    var short:String {
        MeasurementFormatter.short.string(from: self)
    }
}
