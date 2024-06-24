//
//  ThreadsTabView.swift
//  ThreadsTutorials
//
//  Created by usradmin on 21/6/24.
//

import SwiftUI

struct ThreadsTabView: View {
    @State var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Feed View")
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none) //Esto hace que cuando el tab esté seleccionado la imagen se muestre rellena caso contrario la imagen no se muestra rellena
                }
        }
    }
}

#Preview {
    ThreadsTabView()
}
