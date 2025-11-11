//
//  projectClassWithEnumDog.swift
//  ClassesAndStructs
//
//  Created by Валерия Пономарева on 11.11.2025.
//

import Foundation

// Задача: напиши класс Dog с перечислением + вычисляемые свойства + методы + тесты

enum DogColor {
    case red, brown, black
    // Можно добавить: white, spotted, golden и т.д.
}

class Dog {
    var name: String
    var color: DogColor
    var age: Int
    var isSleeping = false  // состояние собаки
    
    init(name: String, color: DogColor, age: Int) {
        self.name = name
        self.color = color
        self.age = age
    }
    
    func sleep() {
        isSleeping = true
        print("\(name) is sleeping 💤")
    }
    
    func wakeUp() {
        isSleeping = false
        print("\(name) woke up! 🐶")
    }
    
    func bark() {
        if isSleeping {
            print("\(name) is sleeping and can't bark")
        } else {
            print("\(name) is barking: Woof! Woof! 🐕")
        }
    }
    
    func describe() {
        print("\(name) is \(age) years old and has \(color) color")
    }
}

var pack: [Dog] = [] // начинаем с пустой стаи

func listDogsInPack() {
    print("The pack is:")
    print("--")
    for dog in pack {
        print(dog.name)
    }
    print("--")
}

func addDogToPack(dog: Dog) {
    pack.append(dog)
    print("\(dog.name) aged \(dog.age) has joined the pack.")
}

// Демонстрация работы
var fido = Dog(name: "Fido", color: .brown, age: 7)
var bruce = Dog(name: "Bruce", color: .black, age: 4)

pack = [fido, bruce]
listDogsInPack()

addDogToPack(dog: Dog(name: "Moose", color: .red, age: 11))
listDogsInPack()

// Тестируем все методы
fido.sleep()
bruce.bark()
fido.bark()  // спящая собака не лает!
fido.wakeUp()
fido.describe()

/* The pack is:
 --
 Fido
 Bruce
 --
 Moose aged 11 has joined the pack.
 The pack is:
 --
 Fido
 Bruce
 Moose
 --
 Fido is sleeping 💤
 Bruce is barking: Woof! Woof! 🐕
 Fido is sleeping and can't bark
 Fido woke up! 🐶
 Fido is 7 years old and has brown color
 
 📊 Оценка улучшений:
 Было    Стало    Улучшение
 Простой класс    Умный класс с состоянием    ✅
 Базовые методы    Логические методы с условиями    ✅
 Простой вывод    Интерактивный вывод с эмодзи    ✅
 Статическое поведение    Динамическое поведение    ✅  */
