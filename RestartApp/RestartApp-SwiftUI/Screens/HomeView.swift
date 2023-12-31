//
//  HomeView.swift
//  RestartApp-SwiftUI
//
//  Created by Elif Bilge Parlak on 16.06.2023.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnBoardingActive : Bool = false
    @State private var isAnimating : Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            //MARK: - HEADER
            Spacer()
            
            ZStack {
                CircleGropuView(ShapeColor: Color("ColorBlue"), ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
            }
            //MARK: - CENTER
            Text("The time that leads to mastery is dependent on the intensity of our focus. ")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            //MARK: - FOOTER
            Spacer()
            Button {
                withAnimation{
                    isOnBoardingActive = true
                }
                
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3,design: .rounded))
            }//BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
