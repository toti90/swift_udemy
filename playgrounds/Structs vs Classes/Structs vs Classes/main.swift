//
//  main.swift
//  Structs vs Classes
//
//  Created by Tamás Tóth on 2019. 06. 11..
//  Copyright © 2019. Tamás Tóth. All rights reserved.
//

import Foundation

var hero = ClassHero(name: "Iron Man", universe: "Marvel")

var anotherMarvelHero = hero
anotherMarvelHero.name = "The Hulk"

print("Hero name = \(hero.name)")
print("AnotherMarvelHero name = \(anotherMarvelHero.name)")
