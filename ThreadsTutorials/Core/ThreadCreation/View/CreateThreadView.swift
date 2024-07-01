//
//  CreateThreadView.swift
//  ThreadsTutorials
//
//  Created by usradmin on 24/6/24.
//

import SwiftUI

struct CreateThreadView: View {
    @State var caption = ""
    // se usa para acceder a la funcionalidad de cerrar o descartar una vista.
    /*
     @Environment es una propiedad de envoltura que permite acceder a valores del entorno proporcionados por el sistema.
     */
    /*
     (\.dismiss) es una clave de entorno para acceder a la acció de descartar una vista.
     */
    /*
     El uso típico es en una vista modal o un sheet (este es nuestro caso cerrar la sheet de New Thread.
     */
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        /*
         No hay navegación pero lo usamos para obtener la barra superior de navegación
         */
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("alex_salcedo")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread...", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                    
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        //Esta parte se le conoce como el handler del boton
                        
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post") {
                        
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    CreateThreadView()
}
