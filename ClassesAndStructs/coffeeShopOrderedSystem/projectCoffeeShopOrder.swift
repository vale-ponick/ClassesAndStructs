//
//  projectCoffeeShopOrder.swift
//  ClassesAndStructs
//
//  Created by Валерия Пономарева on 11.11.2025.
//

import Foundation

// Задача: 'Система заказа в кофейне'
/* Создай структуру Coffee (Кофе):
- Свойства: name, price, size (маленький/средний/большой)

Создай класс Order (Заказ):
- Свойства: items: [Coffee], orderTime, totalPrice
- Методы:
  1. addCoffee(_ coffee: Coffee) - добавляет кофе в заказ
  2. removeCoffee(at index: Int) - удаляет кофе по индексу
  3. applyDiscount(_ percent: Double) -> Double - применяет скидку в %

Особенности:
- Каждый кофе имеет базовую цену в зависимости от размера:
  маленький: цена * 1.0, средний: цена * 1.3, большой: цена * 1.6
- Скидка не может быть больше 50% */

enum Size: Double {
    case small = 1.0
    case medium = 1.3
    case big = 1.6
}

enum CoffeeName: String { // или уместнее struct? храним и все ...
    case espresso = "Espresso"
    case americano = "Americano"
    case latte = "Latte"
    
}

struct Coffee {
    let name: String
    let basePrice: Double
    var size: Size
    
    var finalPrice: Double { // вычисляемое свойство
        return basePrice * size.rawValue // ✅ правильная логика!
    }
}

class Order {
    var orders: [Coffee]
    var orderTimes: Date
    
    var totalPrice: Double { // вычисляет общую стоимость
        return orders.reduce(0) {$0 + $1.finalPrice }
    }
    
    
    init(orders: [Coffee] = [], orderTimes: Date = Date()) {
        self.orders = orders
        self.orderTimes = orderTimes
    }
    
    func addCoffee(_ coffee: Coffee) { // добавим кофе в заказ
        orders.append(coffee)
    }
    
    func removeCoffee(at index: Int) { // удаляет кофе по индексу
        orders.remove(at: index)
    }
    
    func applyDiscount(_ percent: Double) -> Double { // применяет скидку не > 50 %
        let maxDiscount = 50.0
        let actualDiscount = min(percent, maxDiscount)
        
        let discountPrice = totalPrice * (1 - actualDiscount / 100)
        return discountPrice
    }
}

print("\n-- Тест системы заказа ☕️ --")

let espresso = Coffee(name: "Espresso", basePrice: 100, size: .small)
let latte = Coffee(name: "Latte", basePrice: 150, size: .big)

let order = Order()
order.addCoffee(espresso)
order.addCoffee(latte)

print("Общая стоимость: 💰 \(order.totalPrice)")
print("Со скидкой 20%: 🔥  \(order.applyDiscount(20))")

/* -- Тест системы заказа ☕️ --
 Общая стоимость: 💰 340.0
 Со скидкой 20%: 🔥  272.0 */
