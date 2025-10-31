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
postAll.add(quote: "- end ")

print("Author \(postAll.author) has published first post \(postAll.title) with text \(postAll.context)")
    print(postWhat === postAll ? "Один объект" : "Разные объекты") // создали 'Разные объекты'

enum DogColor {
    case red
    case brown
    case black
}

class Dog {
    var name: String
    var color: DogColor
    var age: Int
    
    init(name: String, color: DogColor, age: Int) {
        self.name = name
        self.color = color
        self.age = age
    }
}

var pack: [Dog] = []

func listDogsInPack() {
    print("The pack is:") // стая состоит из:
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
var fido = Dog(name: "Fido", color: .brown, age: 7)
var bruce = Dog(name: "Bruce", color: .black, age: 4)


pack = [fido, bruce]
listDogsInPack()

addDogToPack(dog: Dog(name: "Moose", color: .red, age: 11))
listDogsInPack()

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
 -- */
