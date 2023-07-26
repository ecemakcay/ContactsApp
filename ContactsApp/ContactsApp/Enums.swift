//
//  Enums.swift
//  ContactsApp
//
//  Created by Ecem Akçay on 24.07.2023.
//

import Foundation

enum Group: CaseIterable {
    case rebels
    case jedi
    case sith
    case republic
    case allContacts
    
    var group: String {
        switch self {
        case .allContacts:
            return "All Contacts"
        case .rebels:
            return "Rebels"
        case .jedi:
            return "Jedi"
        case .sith:
            return "Sith"
        case .republic:
            return "Republic"
        }
    }
}

enum Gender : CaseIterable{
    case female
    case male
   
    var gender: String {
        switch self {
        case .female:
            return "female"
        case .male:
            return "male"
        }
    }
    
}
