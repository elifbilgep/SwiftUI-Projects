//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Elif Bilge Parlak on 20.06.2023.
//

import SwiftUI

struct InfoPanelView: View {
    var scale : CGFloat
    var offset : CGSize
    
    @State private var isInfoPanelVİsible : Bool = false
    
    var body: some View {
        HStack{
            //MARK: - HOTSPOT
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30,height: 30)
                .onLongPressGesture (minimumDuration: 1){
                    withAnimation(.easeOut){
                        isInfoPanelVİsible.toggle()
                    }
                }
            Spacer()
            
            //MARK: - INFOPANEL
            HStack(spacing: 2){
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                Spacer()
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                
                Spacer()
            }.font(.footnote)
                .padding(8)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .frame(maxWidth: 420)
                .opacity(isInfoPanelVİsible ? 1 : 0)
            
        }
        Spacer()
        
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
