//
//  TextFieldsExampleDemoView.swift
//  SwiftUIMindBlowing
//
//  Created by ohernandezltkmac on 9/22/21.
//

import SwiftUI

struct TextFieldsExampleDemoView: View {
    @State private var username: String = ""
    @State private var textValue: String = ""
    @State private var textValue1: String = ""
    @State private var textValue2: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter username...", text: $username).textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("SecureField", text: $textValue).textFieldStyle(RoundedBorderTextFieldStyle()).tag("9998")
            TextField("Enter text1...", text: $textValue1).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Enter text2...", text: $textValue2).textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Test Button") {
                print("Button tapped!")
            }
            .padding()
            .background(Color.gray)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
        .navigationBarTitle("TextFields")
        .padding()
//        .padding(.bottom, keyboardResponder.keyboardHeight)
    }
}

