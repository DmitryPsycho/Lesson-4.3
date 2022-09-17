//
//  ContentView.swift
//  Lesson 4.3
//
//  Created by Psycho on 14.09.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    
    @AppStorage("name") var currentUser: String?
    
    var body: some View {
        VStack {
            Text("Hi, \(currentUser ?? "No name")")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            
            ButtonView(timer: timer)
            
            Spacer()
            
            LogoutButtonView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.title)
                .bold()
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4))
    }
}

struct LogoutButtonView: View {
    @EnvironmentObject private var user: UserManager
    
    @AppStorage("name") var currentUser: String?
    @AppStorage("signed") var userSignedIn = true
    
    var body: some View {
        Button(action: logOut) {
            Text("LogOut")
                .font(.title)
                .bold()
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.blue)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4))
        .padding()
    }
    
    private func logOut() {
        currentUser = nil
        userSignedIn = false
        user.name = ""
        user.isSigned = userSignedIn
    }
}
