//
//  TutorialView.swift
//  YogaPose
//
//  Created by Lucinda Artahni on 22/05/24.
//

import SwiftUI

struct TutorialView: View {
    @State var navigateToMainView = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("SplashScreen")
                    .resizable()
                    .frame(width: .infinity, height: .infinity)
                VStack{
                    Text("How to Yoga with OnePose?")
                        .fontDesign(.rounded)
                        .fontWeight(.medium)
                        .font(.system(size: 60))
                        .foregroundColor(Color(hex: "FFFEF0"))
                        .padding(.bottom, 10)
                    
                    HStack{
                        ForEach(steps) { step in
                            StepComponent(step: step)
                        }
                    }
                }
                Button(action: {
                    navigateToMainView.toggle()
                }, label: {
                    Image("Next")
                })
                .position(x: 1145, y: 785)
                
                NavigationLink(destination:  MainView(), isActive: $navigateToMainView) {
                    EmptyView()
                }
                .hidden()
                
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    TutorialView()
}
