//
//  classesAndInstances.swift
//  ClassesAndStructs
//
//  Created by Валерия Пономарева on 11.11.2025.
//

import Foundation

// Задача от А.Ефимова по теме 'Классы и экземпляры классов'

class Orange {
    var color: String = ""
    var taste: String = ""
    let radius: Double // обязательное свойство - НЕ присваиваем значение
    
    init(radius: Double) {
        self.radius = radius // все свойства Д.Б. иниц-ны
    }
    
    init(color: String, taste: String, radius: Double) {
        self.color = color
        self.taste = taste
        self.radius = radius
    }
    
    var orangeVolume: Double { // вычисляемое свойство
        return calcOrangeVolume() // геттер просто вызывает метод
    }
    
    func calcOrangeVolume() -> Double {
        return (4.0/3.0) * Double.pi * pow(radius, 3)
    }
    
    var description: String {
        return "Orange has \(color) color and \(taste) taste. The volume of orange is \(String(format: "%.2f", orangeVolume))."
    }
}


// вывод на консоль
let orange = Orange(radius: 12)
orange.color = "orange"
orange.taste = "sweet"


print(orange.description) // Orange has orange color and sweet taste. The volume of orange is 7238.23.
print("Volume from getter: \(String(format: "%.2f", orange.orangeVolume))") // Volume from getter: 7238.23
print("Volume from method: \(String(format: "%.2f", orange.calcOrangeVolume()))") // Volume from method: 7238.23
