//
//  RegistrationViewModel.swift
//  ThreadsTutorials
//
//  Created by usradmin on 1/7/24.
//

import Foundation
/*
 ObservableObject es un protocolo que permite que la vista observe los cambios en el estado de la clase y de actualice automáticamente cuando dichos cambios ocurren.
 */
class RegistrationViewModel: ObservableObject {
    /*
     @Published es un atributo de propiedad que SwiftUI observa automáticamente, cuando cambia el valor de email, cualquier vista que esté observando RegistrationViewModel se actualizará automáticamente.
     */
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
        /*
         Llama a un método asíncrono createUser en un servicio compartido
         */
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password, 
            fullname: fullname,
            username: username
        )
    }
}
