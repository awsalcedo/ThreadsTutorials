//
//  ExploreView.swift
//  ThreadsTutorials
//
//  Created by usradmin on 24/6/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        @State var searchText = ""
        
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { user in
                        VStack {
                            UserCell()
                            
                            Divider()
                        }
                        .padding(.vertical, 4)
                    
                    }
                }
            }
            /*
             Para mostrar la barra de búsqueda
             */
            .searchable(text: $searchText, prompt: "Search")
            .navigationTitle("Search")
        }
    }
}

#Preview {
    ExploreView()
}
