//
//  CircularProfileImageView.swift
//  ThreadsTutorials
//
//  Created by usradmin on 26/6/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("foto1")
            .resizable ()
            .scaledToFill() //Para asegurase de que la relación de aspecto sea correcta
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
