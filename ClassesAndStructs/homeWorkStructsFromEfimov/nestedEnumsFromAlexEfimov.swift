//
//  solvedFromAlexEfimov.swift
//  ClassesAndStructs
//
//  Created by Валерия Пономарева on 14.11.2025.
//

import Foundation

// Задача: создай enum DistanceUnit with case versta, km, mile + .map()

enum RangeUnit {
    enum NonISUCountry: String {
        case usa = "USA" // исходные значение присвоены
        case liberia = "Liberia"
        case myanmar = "Myanmar"
    }
    
    case versta(title: String, denotation: String, countries: [String])
    case kilometer(title: String, denotation: String, countries: [String]) // ассоциативные параметры
    case mile(title: String, denotation: String, countries: [NonISUCountry])
}

let versta1: RangeUnit = .versta(
    title: "Versta",
    denotation: "versta",
    countries: ["Moscow", "Russia Impire"]
)
    
let kilometer1: RangeUnit = .kilometer(
    title: "Kilometer",
    denotation: "km",
    countries: ["Russia", "France", "Italy"]
)

let mile1: RangeUnit = .mile(
    title: "Mile",
    denotation: "ml",
    countries: [.liberia, .myanmar, .usa]
)

func getInfoAbout(_ rangeUnit: RangeUnit) {
    switch rangeUnit  {
    case let .versta(title, denotation, countries),
         let .kilometer(title, denotation, countries):
        print("\(title). Short title \(denotation). Countries: \(countries.formatted())")
    case let .mile(title, denotation, countries):
        let nonISUCountries = countries.map { $0.rawValue }
        print("\(title). Short title: \(denotation). Countries: \(nonISUCountries.formatted())")
    }
}

//getInfoAbout(versta1)
//getInfoAbout(kilometer1)
//getInfoAbout(mile1)

/* Задача: создай enum DistanceUnit with case versta, km, mile + .map()
 
Versta. Short title versta. Countries: Moscow и Russia Impire
Kilometer. Short title km. Countries: Russia, France и Italy
Mile. Short title: ml. Countries: Liberia, Myanmar и USA */
