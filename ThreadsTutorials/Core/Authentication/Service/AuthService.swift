//
//  AuthService.swift
//  ThreadsTutorials
//
//  Created by usradmin on 1/7/24.
//

import Firebase

class AuthService {
    
    static let shared = AuthService()
    
    /*
     @MainActor asegura que la fucnión se ejecute en el hilo principal, necesario para actualizar la interfaz de usuario.
     */
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        // siempre que se hace throws se usa el bloque do - catch
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: Created user \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
}
