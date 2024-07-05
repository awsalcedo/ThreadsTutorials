//
//  AuthService.swift
//  ThreadsTutorials
//
//  Created by usradmin on 1/7/24.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    /*
     @MainActor asegura que la función se ejecute en el hilo principal, esto es importante porque las operaciones que interactúan con la UI o realizan ciertas actualizaciones de estado deben ejecutarse en el hilo principal.
     */
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        // siempre que se hace throws se usa el bloque do - catch
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            try await uploadUserData(withEmail: email, password: password, fullname: fullname, username: username, id: result.user.uid)
            
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() // cierra la sesión con el backend en este caso Firebase.
        self.userSession = nil // elimina la sesión localmente actualizando a nulo la sesion del usuario.
    }
    
    
    /*
     @MainActor asegura que la función se ejecute en el hilo principal, esto es importante porque las operaciones que interactúan con la UI o realizan ciertas actualizaciones de estado deben ejecutarse en el hilo principal.
     
     Cualquier llamada a la función debe manejar los posibles errores utilizando try y capturar las excepciones apropiadamente.
     */
    @MainActor
    private func uploadUserData(
        withEmail email: String,
        password: String,
        fullname: String,
        username: String,
        id: String
    ) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username)
        /*
         Codifica el objeto user, si la codificación falla el hace un return y no ejecuta la siguiente linea, la cual corresponde a la subida de usuario a Firestore.
         
         guard es un forma elegante y efectiva de manejar condiciones que deben cumplirse, es este cado se  asegura que se suba datos válidos a Firestore, permite una salida temprana del método si la condición no se cumple, en este caso, si userData es nil, el método sale inmediatamente con return
         
         Si no se usara guard, la alternativa es usar con un if.
         
         El uso de try? intenta ejecutar encode(user), este método lanza una excepción en caso de error, si encode(user) lanza un error, el resultado de encode(user) se convierte en nil, esto permite manejar errores de una manera que no se interrumpa el flujo del programa con una excepción.
         */
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        
        /*
         Si existe algún error durante la subida del usuario a Firestore, el error se propaga porque la definición de la función uploadUserData hace un thows, y como setData propaga errores, es decir hace un throws, se maneja ese error con try luego el método uploadUserData propaga ese error.
         
         Tiene también el modificador await porque setDate tiene el modificador async
         */
        try await Firestore.firestore().collection("users").document(id).setData(userData)
    }
}
