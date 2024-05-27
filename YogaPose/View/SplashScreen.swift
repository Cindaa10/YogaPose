//
//  SplashScreen.swift
//  YogaPose
//
//  Created by Lucinda Artahni on 22/05/24.
//

import SwiftUI

struct SplashScreen: View {
    @State var showTutorial = false
    
    var body: some View {
        if showTutorial{
            TutorialView()
        } else{
            ZStack{
                NavigationLink(destination: MainView(), isActive: $showTutorial) { //TODO: - masih warning nih
                    EmptyView()
                }
                
                 Image("SplashScreen")
                    .resizable()
                    .frame(width: .infinity, height: .infinity)
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 324, height: 545)
                
            }
            .ignoresSafeArea()
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation{
                        showTutorial.toggle()
                        
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
        
    }
}

#Preview {
    SplashScreen()
}
