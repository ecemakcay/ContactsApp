//
//  Contacts.swift
//  ContactApp
//
//  Created by Ecem Akçay on 24.07.2023.
//

import Foundation


class Contact {
    var name:String?
    var gender:Gender?
    var group:Group?
    
    init(){}
    
    init(name: String, gender: Gender, group: Group) {
        self.name = name
        self.gender = gender
        self.group = group
    }
}

struct Contacts {
    static let contactInfos: [Contact] = [
        Contact(name: "Anakin Skywalker", gender: .male, group: .jedi),
        Contact(name: "Luke Skywalker", gender: .male, group: .jedi),
        Contact(name: "Obi-Wan Kenobi", gender: .male, group: .jedi),
        Contact(name: "Master Yoda", gender: .male, group: .jedi),
        Contact(name: "Qui-Gon Jinn", gender: .male, group: .republic),
        Contact(name: "Princess Leia Organa", gender: .female, group: .rebels),
        Contact(name: "Han Solo", gender: .male, group: .rebels),
        Contact(name: "Chewbacca", gender: .male, group: .rebels),
        Contact(name: "Darth Vader", gender: .male, group: .sith),
        Contact(name: "Dart Maul", gender: .male, group: .sith),
        Contact(name: "Emperor Palpatine", gender: .male, group: .sith),
        Contact(name: "Padmé Amidala", gender: .female, group: .republic),
        Contact(name: "Mace Windu", gender: .male, group: .republic)
      
    ]
}
