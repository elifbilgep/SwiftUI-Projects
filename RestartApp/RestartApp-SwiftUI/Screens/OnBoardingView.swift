//
//  OnBoardingView.swift
//  RestartApp-SwiftUI
//
//  Created by Elif Bilge Parlak on 16.06.2023.
//

import SwiftUI

struct OnBoardingView: View {
    //MARK: - PROPERTY
    @AppStorage("onboarding") var isOnBoardingActive : Bool = true
    
    @State private var buttonWidth : Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset : CGFloat = 0
    @State private var isAnimating : Bool = false 
    
    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea()
            VStack(spacing: 20) {
                  //MARK: - HEADER
                Spacer()
          
                VStack(spacing:0){
                    Text("Share")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
                    It's not how much we give but
                    how much love we put into giving.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,10)
                }.opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : -40)
                    .animation(.easeOut(duration: 1), value: isAnimating)
                //MARK: - CENTER
                ZStack{
                    CircleGropuView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                }//ZStack
                Spacer()
                //MARK: - FOOTER
                ZStack{
                    //Parts of the custom button
                    //1 Background (Static)
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                       
                    
                    //2 Call to action (Static)
                    Text("Get Started")
                        .font(.system(.title3,design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    //3 Capsule (Dynamic width)
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    
                    //4 Cırcle (Draggable)
                    
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.blue.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24,weight: .bold))
                        }.foregroundColor(.white)
                            .frame(width: 80,height: 80,alignment: .center)
                            .offset(x: buttonOffset)
                            .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation(.easeOut(duration: 0.4)){
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 80
                                            isOnBoardingActive = false
                                        }else{
                                            withAnimation(.easeInOut(duration:  1)){
                                                buttonOffset = 0
                                            }
                                        }
                                    }
                                })
                            )//Gesture
                        Spacer()
                    }
                    
                }//Footer
                .frame(width: buttonWidth,height: 80,alignment: .center)
                .padding()
                .opacity(isAnimating ? 0 : 1)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            } //VStack
        }//: ZSTACK
        .onAppear {
            isAnimating = true
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}

