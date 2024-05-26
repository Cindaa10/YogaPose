//
//  ResultScreen.swift
//  YogaPose
//
//  Created by Lucinda Artahni on 22/05/24.
//

import SwiftUI

struct ResultScreen: View {
    @State var navigateToSplashScreen = false
    var body: some View {
        NavigationStack{
            ZStack{
                Image("ResultScreen")
                    .resizable()
                    .frame(width: .infinity, height: .infinity)
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                
                VStack{
                    Text("Congratulations on Finishing this Yoga!")
                        .fontDesign(.rounded)
                        .fontWeight(.medium)
                        .font(.system(size: 64))
                        .foregroundColor(Color(hex: "FFFEF0"))
                        .padding(.top, 15)
                    
                    HStack{
                        Image("PoseResult")
                            .resizable()
                            .frame(width: 207, height: 648)
                            .padding(.leading, -25)
                        
                        
                        VStack(alignment: .leading){
                            Spacer()
                            HStack{
                                Text("Tadasana Pose")
                                    .fontDesign(.rounded)
                                    .fontWeight(.medium)
                                    .font(.system(size: 45))
                                    .foregroundColor(Color(hex: "FED459"))
                                    .padding(.bottom, 0)
                                
                                Image("LotusBackground")
                                    .resizable()
                                    .frame(width: 129, height: 96)
                                
                            }
                            
                            
                            Text("In Sanskrit, 'Tada' means mountain, and 'asana' means pose. Tadasana is typically performed at the beginning and end of a yoga session to establish a grounded and balanced foundation.")
                                .fontDesign(.rounded)
                                .fontWeight(.medium)
                                .font(.system(size: 24))
                                .foregroundColor(Color(hex: "FFFEF0"))
                                .padding(20)
                                .padding(.top, -15)
                                .lineLimit(nil)
                                .minimumScaleFactor(0.5)
                                .frame(width: 699)
                            
                            
                            Text("Stand tall, feel strong, and radiate confidence! Your dedication to practicing Tadasana has brought remarkable results. Through this journey, you've enhanced your posture, improved your balance, and cultivated inner calmness. Keep up the great work and continue to embrace the benefits of Tadasana in your daily life!")
                                .fontDesign(.rounded)
                                .fontWeight(.medium)
                                .font(.system(size: 24))
                                .foregroundColor(Color(hex: "FFFEF0"))
                                .padding(20)
                                .padding(.bottom, 27)
                                .lineLimit(nil)
                                .minimumScaleFactor(0.5)
                                .frame(width: 699)
                            
                            
                        }
                        .padding(.leading, 56)
                        .padding(.bottom, 130)
                        
                    }
                    
                    
                }
                Button(action: {
                    navigateToSplashScreen.toggle()
                }, label: {
                    Image("Next")
                })
                .position(x: 1145, y: 785)
                
                NavigationLink(destination: SplashScreen() , isActive: $navigateToSplashScreen) {
                    EmptyView()
                }
                .hidden()
                
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ResultScreen()
}
