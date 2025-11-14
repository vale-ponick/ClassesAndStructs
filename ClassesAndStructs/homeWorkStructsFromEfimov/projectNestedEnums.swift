//
//  projectNestedEnums.swift
//  ClassesAndStructs
//
//  Created by Валерия Пономарева on 14.11.2025.
//

import Foundation

// Задача: создай enum DistanceUnit with case versta, km, mile. Внутри него создай еще один enum NonISUCountry, в кот. перечислены страны, НЕ принявшие межд. систему единиц (USA, Liberia, Myanmar). versta, km д. иметь АССОЦИИРОВАННЫЕ параметры (title: String, denotation: Strng, country: [String]). mile - (title: String, denotation: Strng, country: [NonISUCountry]). Создайте по экземпляру DistanceUnit для каждого кейса и функцию, которая должна принимать единицу измерения и выводить на консоль инфу о ней типа "Километр. Краткое наименование: км. Страны: Россия, страны ЕС".

enum DistanceUnit {
    enum NonISUCountry: String {
        case usa = "USA" // исходные значение присвоены
        case liberia = "Liberia"
        case myanmar = "Myanmar"
    }
    
    case versta(title: String, denotation: String, countries: [String])
    case kilometer(title: String, denotation: String, countries: [String]) // ассоциативные параметры
    case mile(title: String, denotation: String, countries: [NonISUCountry])
}

let versta: DistanceUnit = .versta(
    title: "Versta 🏰",
    denotation: "versta",
    countries: [
        "Moscow Principality",
        "Russia Impire"]
)
    
let kilometer: DistanceUnit = .kilometer(
    title: "Kilometer 🛣️",
    denotation: "km",
    countries: [
        "RF",
        "France",
        "Italy"]
)

let mile: DistanceUnit = .mile(
    title: "Mile 🇺🇸",
    denotation: "ml",
    countries: [.liberia, .myanmar, .usa]
)

func getInfoAbout(_ distanceUnit: DistanceUnit) {
    switch distanceUnit {
    case let .versta(title, denotation, countries):
        print("🏰 ВЕРСТА: \(title)")
        print("   📍 Обозначение: \(denotation)")
        print("   🇷🇺 Страны: \(countries.joined(separator: ", "))")
        print()
        
    case let .kilometer(title, denotation, countries):
        print("🇪🇺 КИЛОМЕТР: \(title)")
        print("   📍 Обозначение: \(denotation)")
        print("   🌍 Страны: \(countries.joined(separator: ", "))")
        print()
        
    case let .mile(title, denotation, countries):
        print("🇺🇸 МИЛЯ: \(title)")
        print("   📍 Обозначение: \(denotation)")
        print("   🗽 Non-ISU страны: \(countries.map { $0.rawValue }.joined(separator: ", "))")
        print()
    }
}

// getInfoAbout(versta)
// getInfoAbout(kilometer)
// getInfoAbout(mile)

/* 🏰 ВЕРСТА: Versta 🏰
 📍 Обозначение: versta
 🇷🇺 Страны: Moscow Principality, Russia Impire

🇪🇺 КИЛОМЕТР: Kilometer 🛣️
 📍 Обозначение: km
 🌍 Страны: RF, France, Italy

🇺🇸 МИЛЯ: Mile 🇺🇸
 📍 Обозначение: ml
 🗽 Non-ISU страны: Liberia, Myanmar, USA   */
