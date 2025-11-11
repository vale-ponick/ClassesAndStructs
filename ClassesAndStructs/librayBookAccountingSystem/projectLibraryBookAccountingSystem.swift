//
//  projectLibraryBookAccountingSystem.swift
//  ClassesAndStructs
//
//  Created by Валерия Пономарева on 11.11.2025.
//

import Foundation

// "Задача: Система учета книг в библиотеке: Создай класс Book с свойствами: название, автор, доступность (true/false). Реализуй методы: взять книгу, вернуть книгу. Создай массив книг и выведи их список.")

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
