//
//  projectNestedEnums.swift
//  ClassesAndStructs
//
//  Created by Валерия Пономарева on 14.11.2025.
//

import Foundation

// Задача: создай enum DistanceUnit with case versta, km, mile. Внутри него создай еще один enum NonISUCountry, в кот. перечислены страны, НЕ принявшие межд. систему единиц (USA, Liberia, Myanmar). versta, km д. иметь АССОЦИИРОВАННЫЕ параметры (title: String, denotation: Strng, country: [String]). mile - (title: String, denotation: Strng, country: [NonISUCountry]). Создайте по экземпляру DistanceUnit для каждого кейса и функцию, которая должна принимать единицу измерения и выводить на консоль инфу о ней типа "Километр. Краткое наименование: км. Страны: Россия, страны ЕС".


