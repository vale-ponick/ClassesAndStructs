//
//  homeWorkStructsFromAlexEfimov.swift
//  ClassesAndStructs
//
//  Created by Валерия Пономарева on 11.11.2025.
//

import Foundation

// HW 8: 2 задачи из курса А.Ефимова по теме 8 'Structs'

class Shape {
    var area: Double {
        0
    }
    var perimeter: Double {
        0
    }
    
    var description: String {
        return String(format: "The area of %@ is %.2f. Perimeter - %.2f",
                     String(describing: type(of: self)), area, perimeter)
    }
}

final class Circle: Shape {
    let radius: Double
    
    override var area: Double {
        Double.pi * radius * radius
    }
    
    override var perimeter: Double {
        2 * Double.pi * radius
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}

class Rectangle: Shape {
    let width: Double
    let height: Double
    
    override var area: Double {
        width * height
    }
    override var perimeter: Double {
        (width + height) * 2
    }
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

final class Ellipse: Rectangle {
    
    override var area: Double {
        Double.pi * width * height
    }
    override var perimeter: Double { // формула условна
        Double.pi * (width + height)
    }
}

let circle = Circle(radius: 12).description
print(circle)

let rectangle = Rectangle(width: 3, height: 4).description
print(rectangle)

let ellipse = Ellipse(width: 7, height: 12).description
print(ellipse)

/* HW 8: 2 задачи из курса А.Ефимова по теме 8 'Structs'.
 The area of Circle is 452.39. Perimeter - 75.40
 The area of Rectangle is 12.00. Perimeter - 14.00
 The area of Ellipse is 263.89. Perimeter - 59.69
 
 NB: если в классе есть свойства - init() обязателен
     НО если есть ТОЛЬКО computed property - то НЕТ! */


// Задача: создай struct Car with properties model + power + description + method increasePower. Create instance and output to console.

struct Car {
    let model: String
    var power: Int
    
    var description: String {
        return "\(model) \(power) hp."
    }
    
    mutating func increasePower(by amount: Int) {
        self.power += amount
    }
}

var toyota = Car(model: "Toyota Rav4", power: 182)
    print(toyota.description) // Toyota Rav4 182 hp.

toyota.increasePower(by: 45)
print(toyota.description) // Toyota Rav4 227 hp.

