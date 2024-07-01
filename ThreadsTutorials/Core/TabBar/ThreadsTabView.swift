//
//  ThreadsTabView.swift
//  ThreadsTutorials
//
//  Created by usradmin on 21/6/24.
//

import SwiftUI

struct ThreadsTabView: View {
    //Para controlar la selección de la pestaña actual
    @State var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
            //Definimos el item de la pestaña
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none) //Esto hace que cuando el tab esté seleccionado la imagen se muestre rellena caso contrario la imagen no se muestra rellena
                }
            //Cuando la pestaña aparece se marque como seleccionada
                .onAppear { selectedTab = 0 }
            //Asigna un valor de etiqueta a esta pestña y se utiliza para gestionar la selección de las pestañas dentro del TabView
                .tag(0)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            //Este es distinto al de arriba porque la lupa no tiene una imagen con relleno
                .onAppear{ selectedTab = 1}
                .tag(1)
            
            Text("") // Para evitar duplicidad de la vista se agrega una en blanco
            //CreateThreadView()
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear { selectedTab = 2 }
                .tag(2)
            
            ActivityView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear { selectedTab = 3 }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear { selectedTab = 4 }
                .tag(4)
    
        }
        .sheet(isPresented: .constant(selectedTab == 2), onDismiss: {
            selectedTab = 0
        }, content: {
            CreateThreadView()
        })
        .tint(.black)
    }
}

#Preview {
    ThreadsTabView()
}
