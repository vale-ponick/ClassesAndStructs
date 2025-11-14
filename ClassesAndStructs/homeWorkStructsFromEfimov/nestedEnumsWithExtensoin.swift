//
//  nestedEnumsWithExtensoin.swift
//  ClassesAndStructs
//
//  Created by Валерия Пономарева on 14.11.2025.
//

import Foundation

// Задача: создай enum DistanceUnit with case versta, km, mile + extension + .map() + rawValue + formatted()

enum LengthUnit {
    enum NonISUCountry: String {
        case usa = "USA" // исходные значение присвоены
        case liberia = "Liberia"
        case myanmar = "Myanmar"
    }
    
    case versta(title: String, denotation: String, countries: [String])
    case kilometer(title: String, denotation: String, countries: [String]) // ассоциативные параметры
    case mile(title: String, denotation: String, countries: [NonISUCountry])
}

let versta: LengthUnit = .versta(
    title: "Versta",
    denotation: "versta",
    countries: ["Moscow Principality", "Russia Impire"]
)
    
let kilometer: LengthUnit = .kilometer(
    title: "Kilometer",
    denotation: "km",
    countries: ["Russia", "France", "Italy"]
)

let mile: LengthUnit = .mile(
    title: "Mile",
    denotation: "ml",
    countries: [.liberia, .myanmar, .usa]
)

extension LengthUnit {
    var info: String {
        switch self {
        case let .versta(title, denotation, countries),
             let .kilometer(title, denotation, countries):
             return "\(title). Short title \(denotation). Countries: \(countries.formatted())"
            
        case let .mile(title, denotation, countries):
             let countriesStr = countries.map { $0.rawValue }
             return "\(title). Short title: \(denotation). Countries: \(countriesStr.formatted())"
        }
    }
}

// print(versta.info)
// print(kilometer.info)
// print(mile.info)
