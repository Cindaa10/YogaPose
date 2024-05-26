//
//  MainView.swift
//  YogaPose
//
//  Created by Lucinda Artahni on 17/05/24.
//

import SwiftUI

struct MainView: View {
    @State var poseStatus = "Unknown"
    @State var desc = "Let's do Pose as below"
    @State var navigateToResultScreen: Bool = false
    
    
    @ObservedObject var timer = TimerYoga()
    
    
    var model = TadasanaPoseFinal()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                HStack {
                    ZStack {
                        Rectangle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(hex: "7368A9"), Color(hex: "CCBAE0")]), startPoint: .top, endPoint: .bottom)
                            )
                            .cornerRadius(30)
                            .frame(width: .infinity, height: .infinity)
                            .padding(.leading, -10)
                        
                        VStack(alignment:.center){
                            HStack{
                                Image("Decor1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 55)
                                
                                Text("Tadasana Pose")
                                    .fontDesign(.rounded)
                                    .fontWeight(.medium)
                                    .font(.system(size: 56))
                                    .foregroundColor(Color(hex: "FFFEF0"))
                                    .padding(.top, 0)
                                
                                Image("Decor1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 55)
                            }
                            Text("\(desc)")
                                .fontDesign(.rounded)
                                .font(.system(size: 24))
                                .foregroundColor(Color(hex: "FFFEF0"))
                                .padding(.top, -30)
                            
                            Text("\(poseStatus)")
                                .fontDesign(.rounded)
                                .font(.system(size: 24))
                                .foregroundColor(Color(hex: "FED459"))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding(.top, -5)
                            
                            
                            ZStack{
                                Image("LotusBackground")
                                    .resizable()
                                    .frame(width: 452, height: 338)
                                
                                Image("Pose")
                                    .resizable()
                                    .frame(width: 85, height: 474)
                                
                                
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 5)
                            
                            Text("Time Left")
                                .fontDesign(.rounded)
                                .font(.system(size: 24))
                                .foregroundColor(Color(hex: "FFFEF0"))
                                .padding(.top, 10)
                            
                            Text(timer.remainingTime)
                                .fontDesign(.rounded)
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .padding(.top, -5)
                            
                        }
                    }
                    .frame(width: geometry.size.width*0.6)
                    
                    
                    CameraView(poseStatus: $poseStatus, desc: $desc, navigateToResultScreen: $navigateToResultScreen, model: model, timer: timer)
                        .background(Color.gray)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .padding(.leading, -42)
                        .frame(width: geometry.size.width*0.4)
                        .zIndex(-1)
                    
                    
                }
                .edgesIgnoringSafeArea(.all)
                
            }
            .navigationBarBackButtonHidden(true)
            
            NavigationLink(destination:  ResultScreen(), isActive: $navigateToResultScreen) {
                EmptyView()
                
            }
            
            .hidden()
        }
    }
    
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

#Preview {
    MainView()
}
