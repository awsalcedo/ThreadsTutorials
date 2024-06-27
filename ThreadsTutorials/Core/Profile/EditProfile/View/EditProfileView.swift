//
//  EditProfileView.swift
//  ThreadsTutorials
//
//  Created by usradmin on 27/6/24.
//

import SwiftUI

struct EditProfileView: View {
    @State var bio = ""
    @State var link = ""
    @State var isPrivateProfile = false
    
    var body: some View {
        NavigationStack {
            /*
             Para superponer la vista de edición de los botones de la parte superior, también es usado para diseños complejos como por ejemplo colocar un texto sobre una imagen, o un botón en la esquina de una vista o crear efectos visuales como sombras, fondos semi-transparentes o gráficos personalizados
             */
            ZStack {
                Color(.systemGroupedBackground)
                /* Para especificar que bordes de la vista deben
                 ignorar las áreas seguras de la pantlla
                 */
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack {
                    // nombre e imagen del profile
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text("Alex Salcedo")
                        }
                        
                        Spacer()
                        
                        CircularProfileImageView()
                    }
                    
                    Divider()
                    
                    // campos para la biografía
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio...", text: $bio, axis: .vertical)
                        
                         
                    }
                    
                    Divider()
                    
                    // campos para link
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Add link...", text: $link)
                    }
                    
                    Divider()
                    
                    // activar profile privado
                    Toggle("Private profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                // para darle el borde negro al recuadro
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding() // para que le aplique sólo a la vista de recuadro
                
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
