//
//  StepComponent.swift
//  YogaPose
//
//  Created by Lucinda Artahni on 22/05/24.
//

import SwiftUI

struct StepComponent: View {
    var step: Step
    var body: some View {
        VStack (alignment: .center){
            Text("Step \(step.stepNum)")
                .fontDesign(.rounded)
                .fontWeight(.medium)
                .font(.system(size: 44))
                .foregroundColor(Color(hex: "FED459"))
                .padding(.bottom, 10)
            
            Image(step.image)
                .resizable()
                .frame(width: 263, height: 409)
                .padding(.bottom, 5)
            
            ZStack{
                Rectangle()
                    .frame(width: 263, height: 161)
                    .cornerRadius(15)
                    .foregroundColor(Color(hex: "443D66"))
                
                Text(step.desc)
                    .fontDesign(.rounded)
                    .fontWeight(.medium)
                    .font(.system(size: 20))
                    .foregroundColor(Color(hex: "FFFEF0"))
                    .padding(20)
                    .lineLimit(nil)
                    .minimumScaleFactor(0.5)
                    .frame(width: 263)
                    
            }
            
        }
        .padding(.horizontal, 45)
    }
}

#Preview {
    StepComponent(step: steps[1])
    
}
