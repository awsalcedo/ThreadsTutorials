//
//  UserCell.swift
//  ThreadsTutorials
//
//  Created by usradmin on 26/6/24.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView()
            
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
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
