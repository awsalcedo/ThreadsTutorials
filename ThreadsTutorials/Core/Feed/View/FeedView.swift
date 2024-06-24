//
//  FeedView.swift
//  ThreadsTutorials
//
//  Created by usradmin on 24/6/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                /*Para cargar los elementos que actualmente estan en pantalla haciendo más eficiente cuando se tiene una gran cantidad de elementos*/
                LazyVStack {
                    /*
                     id: \.self indica que cada elemento del rango se identifica a sí mismo. En este caso, cada número del rango es único y se usa como identificador
                     */
                    ForEach(0 ... 10, id: \.self) { thread in
                        //Text("Thread goes here: \(thread)")
                        ThreadCell()
                    }
                }
            }/*
              Para refrescar la lista cuando se deslice la pantalla hacia abajo
              */
            .refreshable {
                print("DEBUG: Refresh threads")
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                /*
                 Para actualizar la lista de manera manual, es decir pulsando el botón
                 */
                Button {
                    
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    /*
     Sino envolvemos en una NavigationStack no aparece el botón de imagen arrow.counterclockwise
     */
    NavigationStack {
        FeedView()
    }
}
