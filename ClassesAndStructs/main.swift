//
//  main.swift
//  ClassesAndStructs
//
//  Created by Валерия Пономарева on 30.10.2025.
//

import Foundation

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

print("Задача: Система учета книг в библиотеке: Создай класс Book с свойствами: название, автор, доступность (true/false). Реализуй методы: взять книгу, вернуть книгу. Создай массив книг и выведи их список.")

class Book {
    let title: String
    let author: String
    let category: String
    var isAvailable: Bool = true
    
    init(title: String, author: String, category: String) {
        self.title = title
        self.author = author
        self.category = category
        self.isAvailable = true
    }

func takeBook() {
    if isAvailable {
        isAvailable = false
        print("the book '\(title)' was taken from the library.")
    } else {
        print("the book '\(title)' was taken by someone else.")
    }
}

func returnBook() {
    if !isAvailable {
        isAvailable = true
        print("the book '\(title)' was returned to the library.")
            } else {
                print("Книга '\(title)' aleady available in the library.")
            }
        }
    
func displayInfo() {
        let status = isAvailable ? "доступна" : "взята"
        print("'\(title)' - \(author) (\(category)) - \(status)")
    }
}

var books: [Book] = []

func add(book: Book) {
    books.append(book)
}

func displayAllBooks() {
    print("\n=== КАТАЛОГ БИБЛИОТЕКИ ===")
    for book in books {
        book.displayInfo()
    }
    print("========================\n")
}

let hobbit = Book(title: "Hobbit", author: "J.R.R.Tolkien", category: "fantasy")
let shining = Book(title: "Shining", author: "Stephen King", category: "horror")
let harryPotter = Book(title: "Harry Potter and the Philosopher's Stone", author: "J.K. Rowling", category: "fantasy")

add(book: hobbit)
add(book: shining)
add(book: harryPotter)

displayAllBooks()

hobbit.takeBook()
shining.takeBook()
hobbit.takeBook()

displayAllBooks()

hobbit.returnBook()
shining.returnBook()

// Финальный статус
displayAllBooks()

/* Задача: Система учета книг в библиотеке: Создай класс Book с свойствами: название, автор, доступность (true/false). Реализуй методы: взять книгу, вернуть книгу. Создай массив книг и выведи их список.
 
 === КАТАЛОГ БИБЛИОТЕКИ ===
 'Hobbit' - J.R.R.Tolkien (fantasy) - доступна <- после возврата станет снова "доступна"
 'Shining' - Stephen King (horror) - доступна
 'Harry Potter and the Philosopher's Stone' - J.K. Rowling (fantasy) - доступна
 ========================

 the book 'Hobbit' was taken from the library.
 the book 'Shining' was taken from the library.
 the book 'Hobbit' was taken by someone else.

 === КАТАЛОГ БИБЛИОТЕКИ ===
 'Hobbit' - J.R.R.Tolkien (fantasy) - взята
 'Shining' - Stephen King (horror) - взята
 'Harry Potter and the Philosopher's Stone' - J.K. Rowling (fantasy) - доступна
 ========================

 the book 'Hobbit' was returned to the library.
 the book 'Shining' was returned to the library.

 === КАТАЛОГ БИБЛИОТЕКИ ===
 'Hobbit' - J.R.R.Tolkien (fantasy) - доступна
 'Shining' - Stephen King (horror) - доступна
 'Harry Potter and the Philosopher's Stone' - J.K. Rowling (fantasy) - доступна
 ======================== */
