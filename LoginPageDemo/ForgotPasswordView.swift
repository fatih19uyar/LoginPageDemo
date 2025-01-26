//
//  ForgotPasswordView.swift
//  LoginPageDemo
//
//  Created by ömer fatih uyar on 26.01.2025.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var showConfirmation: Bool = false
    @State private var isLoginPageActive: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 30 ) {
                Spacer()
                
                Text("Şifremi Unuttum")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                
                Text ("Şifrenizi sıfırlamak için kayıtlı e-posta adresinizi aşağıya girin. Talimatlar e-posta adresinize gönderilecektir.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                TextField("E-posta adresinizi girin.", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding(.horizontal, 20)
                
                Button(action: {
                    
                    if !email.isEmpty {
                        showConfirmation = true
                        print("Şifre sıfırlama talebi gönderildi: \(email)")
                    }
                    
                }){
                    Text("Şifreyi Sıfırla")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(email.isEmpty ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                }
                .disabled(email.isEmpty)
                
                Spacer()
                
                Button(action : {
                    isLoginPageActive = true
                }){
                    Text("Giriş Sayfasına Dön")
                        .foregroundColor(.blue)
                        .font(.footnote)
                }
                .navigationDestination(isPresented: $isLoginPageActive) {
                    ContentView()
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }

}

#Preview {
    ForgotPasswordView()
}
