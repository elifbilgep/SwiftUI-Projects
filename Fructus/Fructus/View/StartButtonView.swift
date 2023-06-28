//
//  StartButtonView.swift
//  Fructus
//
//  Created by Elif Bilge Parlak on 28.06.2023.
//

import SwiftUI

struct StartButtonView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        Button {
            print("Exitting")
        } label: {
            HStack(spacing:8) {
                 Text("Start")
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }.accentColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical,10)
            .background(
                Capsule().strokeBorder(.white, lineWidth: 1.25)
            )
        }

    }
}

//MARK: - PREVIEW
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView().previewLayout(.sizeThatFits)
    }
}
