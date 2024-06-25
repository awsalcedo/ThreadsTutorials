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
                        HStack {
                            Image("foto1")
                                .resizable ()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("alex_salcedo")
                                    .fontWeight(.semibold)
                                
                                Text("Alex Salcedo")
                                
                            }
                            .font(.footnote)
                            
                            Spacer()
                            
                            Text("Follow")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 100, height: 32)
                            /*
                             Para formar una figura de botón alrededor del Text
                             */
                                .overlay{
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(.systemGray4), lineWidth: 1)
                                }
                            
                        }
                        
                        Divider()
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
