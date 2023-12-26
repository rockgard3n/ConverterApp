//
//  ContentView.swift
//  ConverterApp
//
//  Created by Liam Cashel on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var unit = ""
    @State private var entry: Double = 0
    @State private var convertTo = "Meters"
    
    let units = ["Meters", "KMs", "CMs", "Feet", "Yards", "Miles"]
    
    var base: Measurement<UnitLength> {
        var length: Measurement<UnitLength>? = nil
        let def = Measurement(value: 0.0, unit: UnitLength.meters)
        
        if unit == "Meters" {
            length = Measurement(value: entry, unit: UnitLength.meters)
        } else if unit == "KMs" {
            length = Measurement(value: entry, unit: UnitLength.kilometers)
        } else if unit == "CMs" {
            length = Measurement(value: entry, unit: UnitLength.centimeters)
        } else if unit == "Feet" {
            length = Measurement(value: entry, unit: UnitLength.feet)
        } else if unit == "Yards" {
            length = Measurement(value: entry, unit: UnitLength.yards)
        } else {
            length = Measurement(value: entry, unit: UnitLength.miles)
        }
        //add more ifs for teh rest of the distances
        return length ?? def
    }
    
    //create another variable for the conversion
    //then print in results section
    var body: some View {
        NavigationStack {
            Form {
                Section("Your measurement") {
                    Slider(value: $entry, in: 0...1000)
                    Picker("Unit measured", selection: $unit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("\(entry, specifier: "%.1f")") + Text(" \(unit)")
                }
                Section("Convert To") {
                    Picker("Unit measured", selection: $convertTo) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Result") {
                    if convertTo == "Meters" {
                        Text("\(base.converted(to: .meters).value) \(convertTo)")
                    } else if convertTo == "KMs" {
                        Text("\(base.converted(to: .kilometers).value) \(convertTo)")
                    } else if convertTo == "CMs" {
                        Text("\(base.converted(to: .centimeters).value) \(convertTo)")
                    } else if convertTo == "Feet" {
                        Text("\(base.converted(to: .feet).value) \(convertTo)")
                    } else if convertTo == "Yards" {
                        Text("\(base.converted(to: .yards).value) \(convertTo)")
                    } else {
                        Text("\(base.converted(to: .miles).value) \(convertTo)")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
