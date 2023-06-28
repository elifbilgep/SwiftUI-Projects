//
//  MotionAnimationView.swift
//  HikeApp
//
//  Created by Elif Bilge Parlak on 27.06.2023.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - PROPERTIES
    @State private var randomCircle : Int = Int.random(in: 6...12)
    @State private var isAnimating : Bool = false
    
    //MARK: - FUNCTIONS
    
    // 1 Random Coordinate
    func randomCoordinate()-> CGFloat{
        return CGFloat.random(in: 0...256)
    }
    
    // 2 Random Size
    func radomSize() -> CGFloat{
        return CGFloat(Int.random(in: 4...80))
    }
    // 3 Random Scale
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }

    // 4 Random Speed
    func randomSpeed() -> Double{
        return Double.random(in: 0.05...1.0)
    }
    
    // Random Delay
    func randomDelay() -> Double{
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .frame(width: radomSize())
                    .opacity(0.25)
                    .position(x: randomCoordinate(),y: randomCoordinate())
                    .scaleEffect(isAnimating ? randomScale() : 1 )
                    .onAppear{
                        withAnimation(.interpolatingSpring(
                            stiffness: 0.25,
                            damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ){
                            isAnimating = true
                        }
                    }
            }
            
        }//ZStack
        .frame(width: 256,height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.teal.ignoresSafeArea()
            MotionAnimationView()
        }
       
    }
}
