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
