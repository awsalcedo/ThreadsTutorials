//
//  ContentViewModel.swift
//  ThreadsTutorials
//
//  Created by usradmin on 2/7/24.
//

import Foundation
import Firebase
/*
 Para manejar de una manera declarativa flujos de datos asíncronos y eventos en Swift, en el contexto de SwiftUI y MVVM, Combine permite que los ViewModels emitan cambios de estado a las vistas de una manera reactiva y eficiente.
 Ofrece una variedad de operadores para transformar, combinar y gestionar los flujos de datos.
 Componentes claves de Combine:
 -Publishers: emiten valores a lo largo del tiempo, ejemplos Just, Future, PassthroughSubject, CurrentValueSubject, etc.
 -Subscribers: reciben y procesan los valores emitidos por los Publishers, Combine proporciona sink y assign como suscriptores básicos.
 -Subjects: actúan tanto como Publishers como Subscribers. Los tipos de Subjects incluyen PassthroughSubject (emite nuevos valores a los suscriptores) y CurrentValueSubject (mantiene y emite el valor más reciente a los nuevos suscriptores).
 -Operators: son funciones que permiten transformar, combinar, filtrar y manipular flujos de datos de los Publishers. Ejemplos de operadores: map, filter, combineLast, flatMap, debounce, throttle, etc.
 */
import Combine

class ContentViewModel: ObservableObject {
    // marca la propiedad como publicada, lo que permite que Combine observe los cambios en su valor.
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        /*
         AuthService.shared.$userSession :

         Aquí, AuthService.shared es una instancia singleton de un servicio de autenticación (AuthService).
         userSession es una propiedad publicada (@Published var userSession) dentro de AuthService.
         El prefijo $ accede al Publisher que Combine genera automáticamente para la propiedad publicada userSession. Este Publisher emitirá nuevos valores cada vez que userSession cambie.
         
         sink { [weak self] userSession in ... } :
         
         [weak self] es una captura débil de self (el ContentViewModel). Esto es importante para evitar un ciclo de retención que podría causar fugas de memoria. Usando [weak self] garantiza que self (el ContentViewModel) no será retenido fuertemente por el closure, permitiendo que sea liberado de la memoria cuando ya no sea necesario.
         
         userSession in self?.userSession = userSession :
         
         Este closure toma el nuevo valor emitido por el Publisher (userSession) y lo asigna a la propiedad userSession del ContentViewModel.
         */
        
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
