//
//  nesstedEnumsWithoutMethodMap.swift
//  ClassesAndStructs
//
//  Created by Валерия Пономарева on 14.11.2025.
//

import Foundation

print("Задача: создай enum IntervalUnit with case versta, km, mile withouth .map()")

enum IntervalUnit {
    enum NonISUCountry: String {
        case usa = "USA" // исходные значение присвоены
        case liberia = "Liberia"
        case myanmar = "Myanmar"
    }
    
    case versta(title: String, denotation: String, countries: [String])
    case kilometer(title: String, denotation: String, countries: [String]) // ассоциативные параметры
    case mile(title: String, denotation: String, countries: [NonISUCountry])
}

let versta: IntervalUnit = .versta(
    title: "Versta",
    denotation: "versta",
    countries: ["Moscow Principality", "Russia Impire"]
)
    
let kilometer: IntervalUnit = .kilometer(
    title: "Kilometer",
    denotation: "km",
    countries: ["Russia", "France", "Italy"]
)

let mile: IntervalUnit = .mile(
    title: "Mile",
    denotation: "ml",
    countries: [.liberia, .myanmar, .usa]
)

func getInfoAbout(_ intervalUnit: IntervalUnit) {
    switch intervalUnit {
    case let .versta(title, denotation, countries),
         let .kilometer(title, denotation, countries):
        print("\(title). Short title \(denotation). Countries: \(countries.formatted())")
    case let .mile(title, denotation, countries):
        var countriesStr:[String] = []
        
        for country in countries {
            countriesStr.append(country.rawValue) // этоn код =  развернутый метод .map()
        }
        
        print("\(title). Short title: \(denotation). Countries: \(countriesStr.formatted())")
    }
}

getInfoAbout(versta)
getInfoAbout(kilometer)
getInfoAbout(mile)

/* Задача: создай enum DistanceUnit with case versta, km, mile + .map()
 
        Versta. Short title versta. Countries: Moscow Principality и Russia Impire
        Kilometer. Short title km. Countries: Russia, France и Italy
        Mile. Short title: ml. Countries: Liberia, Myanmar и USA */
