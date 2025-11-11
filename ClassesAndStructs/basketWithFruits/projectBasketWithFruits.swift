//
//  projectBasketWithFruits.swift
//  ClassesAndStructs
//
//  Created by Валерия Пономарева on 11.11.2025.
//

import Foundation
// Задача: 'Basket with fruits'

struct Apple {
    let name: String // храним свойства яблока
    let radius: Double
    let density: Double
    
    var weightApple: Double { // вычисляемое свойство
        return (4.0/3.0) * Double.pi * pow(radius, 3) * density // вычислили ВЕС яблока
    }
}
    
    class Basket {
        var fruits: [Apple] = [] // массив яблок
        let maxWeight: Double    // max вес яблока
        
        init(fruits: [Apple] = [], maxWeight: Double) { // Добавь значение по умолчанию для fruits
            self.fruits = fruits
            self.maxWeight = maxWeight
        }
        
        func addApple(_ apple: Apple) -> Bool { // метод класса 'добавь яблоко'
            let newTotalWeight = calcTotalWeight() + apple.weightApple
                if newTotalWeight <= maxWeight {
                    fruits.append(apple)
                    return true
                } else {
                    return false
                }
            }
        
        func calcTotalWeight() -> Double { // метод класса 'рассчитай общий вес'
            return fruits.reduce(0) { $0 + $1.weightApple }
        }
        
        func findHeaviest() -> Apple? { // метод класса 'найди самое тяжелое яблоко'
            return fruits.max(by: { $0.weightApple < $1.weightApple })
        }
    }

// tests
print("___'The Basket of fruits'___\n")
let greenApple = Apple(name: "Green Apple", radius: 5.0, density: 0.8)
let redApple = Apple(name: "Red Apple", radius: 6.0, density: 0.9)
let giantApple = Apple(name: "Giant Apple", radius: 10.0, density: 0.85)
    
print("Apple weights:")
print(" - \(greenApple.name): \(String(format: "%.2f", greenApple.weightApple))")
print(" - \(redApple.name): \(String(format: "%.2f", redApple.weightApple))")
print(" - \(giantApple.name): \(String(format: "%.2f", giantApple.weightApple))")


let basket = Basket(maxWeight: 2000.0)

print("Adding apples:")
print(" - \(greenApple.name): \(basket.addApple(greenApple) ? "Success" : "Failed")")
print(" - \(redApple.name): \(basket.addApple(redApple) ? "Success" : "Failed")")
print(" - \(giantApple.name): \(basket.addApple(giantApple) ? "Success" : "Failed")")
print()

print("Total weight: \(String(format: "%.2f", basket.calcTotalWeight()))")

if let heaviest = basket.findHeaviest() {
    print("Heaviest apple: \(heaviest.name) (\(String(format: "%.2f", heaviest.weightApple)))")
} else {
    print("Basket is empty")
}
/* ___'The Basket of fruits'___
 
 Apple weights:
  - Green Apple: 418.88
  - Red Apple: 814.30
  - Giant Apple: 3560.47
 Adding apples:
  - Green Apple: Success
  - Red Apple: Success
  - Giant Apple: Failed

 Total weight: 1233.18
 Heaviest apple: Red Apple (814.30) */
