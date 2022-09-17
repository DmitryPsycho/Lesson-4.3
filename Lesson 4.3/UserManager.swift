//
//  UserManager.swift
//  Lesson 4.3
//
//  Created by Psycho on 14.09.2022.
//

import Foundation

class UserManager: ObservableObject {
    @Published var name = ""
    @Published var isSigned = false
    
    var symbolsValid: Bool {
        name.count > 2
    }
}
