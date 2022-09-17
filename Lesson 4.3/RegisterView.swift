//
//  RegisterView.swift
//  Lesson 4.3
//
//  Created by Psycho on 14.09.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var user: UserManager
    
    @AppStorage("name") var currentUser: String?
    @AppStorage("signed") var userSignedIn = false
    
    var body: some View {
        ZStack {
            VStack {
                UserTextFieldView(name: $user.name, nameValid: user.symbolsValid)
                
                Button(action: registerUser) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("OK")
                    }
                }
                .disabled(!user.symbolsValid)
            }
        }
    }
    
    private func registerUser() {
        if !user.name.isEmpty {
            currentUser = user.name
            userSignedIn.toggle()
            user.isSigned = userSignedIn
        }
    }
}

struct UserTextFieldView: View {
    @Binding var name: String
    var nameValid = false
    
    var body: some View {
        TextField("Enter your name", text: $name)
            .multilineTextAlignment(.center)
        Text("\(name.count)")
            .foregroundColor(nameValid ? .green : .red)
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}

