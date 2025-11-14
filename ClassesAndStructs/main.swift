//
//  main.swift
//  ClassesAndStructs
//
//  Created by Валерия Пономарева on 30.10.2025.
//

import Foundation

print("ЗАДАЧА от Alex Efimov: начинающий блогер пишет статью о классах")

print("Задача: напиши класс Dog с перечислением + вычисляемые свойства + методы + тесты")

print("Задача: Система учета книг в библиотеке: Создай класс Book с свойствами: название, автор, доступность (true/false). Реализуй методы: взять книгу, вернуть книгу. Создай массив книг и выведи их список.")

print("Задача от А.Ефимова по теме 'Классы и экземпляры классов'.")

print("Задача: 'Система заказа в кофейне'.")

print("Lesson from Alex Efimov's course 'Junior iOS-Developer 2023'.")

print("Задача: 'Basket with fruits'.")

print("Задача: Система учета книг в библиотеке: Создай класс Book с свойствами: название, автор, доступность (true/false). Реализуй методы: взять книгу, вернуть книгу. Создай массив книг и выведи их список.")

print("HW 8: 2 задачи из курса А.Ефимова по теме 8 'Structs'.")

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

getInfoAbout(versta)
getInfoAbout(kilometer)
getInfoAbout(mile)

/* 🏰 ВЕРСТА: Versta 🏰
 📍 Обозначение: versta
 🇷🇺 Страны: Moscow Principality, Russia Impire

🇪🇺 КИЛОМЕТР: Kilometer 🛣️
 📍 Обозначение: km
 🌍 Страны: RF, France, Italy

🇺🇸 МИЛЯ: Mile 🇺🇸
 📍 Обозначение: ml
 🗽 Non-ISU страны: Liberia, Myanmar, USA   */
