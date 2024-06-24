//
//  LoginView.swift
//  ThreadsTutorials
//
//  Created by usradmin on 20/6/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        @State var email = ""
        @State var password = ""
        /*
         Para regresar entre la página de inicio de sesión
         y la de registro
         */
        NavigationStack {
            VStack {
                Spacer()
                
                Image("theads-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                VStack {
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifier())
                    
                    SecureField("Enter yopur password", text: $password)
                        .modifier(ThreadsTextFieldModifier())
                }
                
                NavigationLink {
                    Text("Forgot password?")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 44)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    /* Al dar click en texto Sign up navega a la siguiente página
                     y en la nueva página se muestra el texto Registration View
                     */
                    //Text("Registration View")
                    RegistrationView()
                        .navigationBarBackButtonHidden(true) //Para ocultar el botón de navegación hacia atrás que está en la parte superior izquierda
                } label: {
                    HStack(spacing: 3) {
                        Text("Don´t have an account?")
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    LoginView()
}
