//
//  ContentView.swift
//  LoginPageDemo
//
//  Created by ömer fatih uyar on 26.01.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isForgotPasswordActive: Bool = false
    @State private var loginError: String? = nil
    
    var body: some View {
        NavigationStack{
            VStack(spacing : 20 ) {
                Text("Hoşgeldiniz")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                
                Text("Lütfen giriş yapın")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Kullanıcı Adı")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    TextField("Kullanıcı adınızı girin", text: $username)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                }
                VStack(alignment: .leading) {
                    Text("Şifre")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    HStack{
                        if isPasswordVisible {
                            TextField("Şifrenizi Giriniz", text: $password)
                        }else {
                            SecureField("Şifrenizi Giriniz", text: $password)
                        }
                        Button(action: {
                            isPasswordVisible.toggle()
                        }){
                            Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    )
                }
                if let error = loginError {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.footnote)
                        .padding(.top, 5)
                }
                Button(action:{
                    login()
                }){
                    Text("Giriş Yap")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    
                }
                .padding(.top, 20)
                Button(action: {
                    isForgotPasswordActive = true
                }) {
                    Text("Şifremi Unuttum")
                        .foregroundColor(.blue)
                        .font(.footnote)
                }
                .navigationDestination(isPresented: $isForgotPasswordActive) {
                    ForgotPasswordView()
                }
                Spacer()
            }
            .padding()
        }
    }
    func login(){
        if username.isEmpty || password.isEmpty {
            loginError = "Kullanıcı adı veya şifre boş olamaz."
        } else if username != "admin" || password != "1234" {
            loginError = "Geçersiz kullanıcı adı veya şifre."
        } else {
            loginError = nil
        }
    }
    
}

#Preview {
    ContentView()
}
