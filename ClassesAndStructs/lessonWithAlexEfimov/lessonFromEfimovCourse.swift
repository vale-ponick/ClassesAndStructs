//
//  lessonFromEfimovCourse.swift
//  ClassesAndStructs
//
//  Created by Валерия Пономарева on 11.11.2025.
//

import Foundation

// Lesson from Alex Efimov's course 'Junior iOS-Developer 2023'
// СТРУКТУРЫ

// ЗАДАЧА: начинающий блогер пишет статью о классах

class Post { // создан шаблон поста
    var title = ""
    var author = ""
    var context: String = ""
    var comments: [String] = []
    var numberOfComments = 0
    
    init(title: String, author: String, context: String) {
        self.title = title // инициализация
        self.author = author
        self.context = context
    }
        func add(comment: String) {
            numberOfComments += 1
            comments.append(comment)
        }
        
        func add(quote: String) -> String {
            context.append(quote)
            return context
        }
        func getInfo() {
              let preview = String(context.prefix(50)) + (context.count > 50 ? "..." : "")
            print("Post: \(title), Author: \(author), Text: \(preview)")
        }
    }
    
let postWhat = Post(title: "What the Dead Man said",
                    author: "Ioanna Hmelevska",
                    context: "Алиция ежедневно звонила мне на работу в обеденное время...")
    
    
    // print("Author \(postWhat.author) has published first post \(postWhat.title) with text \(postWhat.body)") // Author Ioanna Hmelevska has published first post What the Dead Man said with text Алиция ежедневно звонила мне на работу в обеденное время...
    
    
    let postAll = Post(title: "All red",
                       author: "Ioanna Hmelevska",
                       context: "'All red' вовсе не значит 'все красное', раздраженно возразила Алиция...")
    
postWhat.add(comment: "So good novel!")
postWhat.add(comment: "Waiting to the continuation")

print("Author \(postAll.author) has published first post \(postAll.title) with text \(postAll.context)")
    print(postWhat === postAll ? "Один объект" : "Разные объекты") // создали 'Разные объекты'


struct PlayerLocation {
    let player: String
    var x: Int
    var y: Int
    
    func getLocation() {
        print("\(player) is at \(x) and \(y)")
    }
}

var playerOne = PlayerLocation(player: "PlayerOne", x: 12, y: 21)

playerOne.getLocation() // PlayerOne is at 12 and 21
playerOne.x = 777
playerOne.getLocation() // PlayerOne is at 777 and 21

/* Отличие STRUCT
 1. Тип данных - value type - создаем ДВА экземпляра == ДВА ОБЪЕКТА -> данные COPY в новую let / var -> НИКОГДА НЕ ссылаются на ОДНУ область в памяти устройства - если меняем значение свойств экземпляра структуры ПОСЛЕ auto init() - объявляем var!
 2. Встроенный init() -> нет наследования -> ВСЕ публ. свойства auto  попадают в параметры init() */

// СРАВНЕНИЕ классов и структур

class Macbook {
    var title: String
    let year: Int
    var color: String
    
    var description: String {
        "\(title) \(year) \(color)"
    }
    
    init(title: String, year: Int, color: String) {
        self.title = title
        self.year = year
        self.color = color
    }
}

let macbookPro = Macbook(title: "Macbook Pro", year: 2025, color: "Silver")
print(macbookPro.description) // Macbook Pro 2025 Silver

let macbookAir = macbookPro
macbookAir.title = "Macbook Air"
macbookAir.color = "Gold"
print(macbookAir.description) // ??? Macbook Air 2025 Gold

// а если два принта соединим вместе?
let macbookPro1 = Macbook(title: "Macbook Pro1", year: 2025, color: "Silver") // Macbook Pro 2025 Silver

let macbookAir1 = macbookPro1 // ссылка на ту же область памяти
macbookAir1.title = "Macbook Air" // поменяли характеристики
macbookAir1.color = "Gold"

print(macbookPro1.description) // Macbook Air 2025 Gold
print(macbookAir1.description) // Macbook Air 2025 Gold

struct IPhone {
    var title: String
    let color: String
    var capacity: Int
    
    var description: String {
        "\(title) \(color) \(capacity)Gb" // память
    }
}
let iPhoneXR = IPhone(title: "iPhone XR", color: "Coral", capacity: 128)

var iPhone14Pro = iPhoneXR
iPhone14Pro.title = "iPhone 14 Pro"

// а если два принта соединим вместе? РАЗНЫЕ - два объекта
print(iPhoneXR.description) // iPhone XR Coral 128Gb
print(iPhone14Pro.description) // iPhone14Pro Coral 128Gb

var num = 12
let anotherNum = num

num = 0
print(anotherNum) // 12 - all basic types == struct
// что лучше? class & struct
/*
 1. все - structs user регистр. в базе данных. есть экран proFile - вносит аватарку, email - получилось 2 объекта == user
 2. КЛАССЫ создаются для управления network meneger - запросы - отправить / принять - ОБЪЕКТ ОДИН! - много ссылок
 3. когда описываем ОБЪЕКТ - эти сущности - модель данных - struct - уникальны и производительны
 4. создавай struct! */

struct Rectangle {
    var width: Int
    var height: Int
    
    var area: Int {
        width * height
    }
    mutating func scale(width: Int, height: Int) { // изменили!
        self.width *= width
        self.height *= height
    }
}
var rectangle = Rectangle(width: 10, height: 5)
print(rectangle.area) // 50
rectangle.scale(width: 2, height: 3)
print(rectangle.area) // 300
