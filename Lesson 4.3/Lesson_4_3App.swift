//
//  Lesson_4_3App.swift
//  Lesson 4.3
//
//  Created by Psycho on 14.09.2022.
//

import SwiftUI

@main
struct Lesson_4_3App: App {
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
        }
    }
}
