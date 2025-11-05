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

enum BookCategory: String, CaseIterable {
    case fantasy = "fantasy"
case horror = "horror"
 case romance = "romance"
 case mystery = "mystery"
 case scienceFiction = "scienceFiction"
 case biography = "biography"
}

class Book {
    let title: String
    let author: String
    let category: BookCategory
    var isAvailable: Bool
    
    init(title: String, author: String, category: BookCategory, isAvailable: Bool) {
        self.title = title
        self.author = author
        self.category = category
        self.isAvailable = isAvailable
    }

func takeBook() {
    if isAvailable { // книга доступна
        isAvailable = false // меняем статус - МОЖНО  = книга сейчас взята! Present Simple
        print(" ✅ the book '\(title)' is now borrowed.")
    } else { // НЕЛЬЗЯ - книга УЖЕ была взята читателем! Past Simple
        print("❌ the book '\(title)' was borrowed by someone reader.")
    }
}

func returnBook() {
    if !isAvailable { // книга НЕ доступна
        isAvailable = true // МОЖНО - только что возвращена! Present Simple
        print("the book '\(title)' is now returned to the library.")
            } else { // НЕЛЬЗЯ - книга уже была доступна - ее НЕЛЬЗЯ вернуть Past Simple
                print("❌ Книга '\(title)' was already available in the library.")
            }
        }
    
func displayInfo() {
        let status = isAvailable ? "✅ available" : "❌ borrowed"
        print("'\(title)' - \(author) (\(category)) - \(status)")
    }
}

var books: [Book] = []

func add(book: Book) {
    books.append(book)
}

func displayAllBooks() {
    print("\n - КАТАЛОГ БИБЛИОТЕКИ - ")
    for book in books {
        book.displayInfo()
    }
    print("---\n")
}

let hobbit = Book(title: "Hobbit", author: "J.R.R.Tolkien", category: .fantasy, isAvailable: true)
let shining = Book(title: "Shining", author: "Stephen King", category: .horror, isAvailable: true)
let harryPotter = Book(title: "Harry Potter and the Philosopher's Stone", author: "J.K. Rowling", category: .fantasy, isAvailable: false)

add(book: hobbit)
add(book: shining)
add(book: harryPotter)

displayAllBooks()

hobbit.takeBook() // ✅ "is now borrowed" (взяли)
shining.takeBook() // ✅ "is now borrowed" (взяли)
hobbit.takeBook() // ❌ "was borrowed by someone" (уже взята)

displayAllBooks()

hobbit.returnBook()  // ✅ "is now returned" (вернули)
shining.returnBook()  // ✅ "is now returned" (вернули)
harryPotter.returnBook() // ❌ "was already available" (уже в библиотеке)

// Финальный статус
print("📚 Доступные категории книг:")
for (index, category) in BookCategory.allCases.enumerated() {
    print("\(index + 1). \(category.rawValue)")
}
displayAllBooks()

/* Задача: Система учета книг в библиотеке: Создай класс Book с свойствами: название, автор, доступность (true/false). Реализуй методы: взять книгу, вернуть книгу. Создай массив книг и выведи их список.
 
 - КАТАЛОГ БИБЛИОТЕКИ -
 'Hobbit' - J.R.R.Tolkien (fantasy) - доступна <- после возврата станет снова "доступна"
 'Shining' - Stephen King (horror) - доступна
 'Harry Potter and the Philosopher's Stone' - J.K. Rowling (fantasy) - доступна
 ---

 the book 'Hobbit' was taken by Vale from the library.
 the book 'Shining' was taken by Vale from the library.
 the book 'Hobbit' was taken by someone else.

 - КАТАЛОГ БИБЛИОТЕКИ -
 'Hobbit' - J.R.R.Tolkien (fantasy) - взята
 'Shining' - Stephen King (horror) - взята
 'Harry Potter and the Philosopher's Stone' - J.K. Rowling (fantasy) - доступна
 ---

 the book 'Hobbit' was returned by Vale to the library.
 the book 'Shining' was returned by Vale to the library.

 - КАТАЛОГ БИБЛИОТЕКИ -
 'Hobbit' - J.R.R.Tolkien (fantasy) - доступна
 'Shining' - Stephen King (horror) - доступна
 'Harry Potter and the Philosopher's Stone' - J.K. Rowling (fantasy) - доступна
 --- */

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


print(orange.description)
print("Volume from getter: \(String(format: "%.2f", orange.orangeVolume))")
print("Volume from method: \(String(format: "%.2f", orange.calcOrangeVolume()))")


