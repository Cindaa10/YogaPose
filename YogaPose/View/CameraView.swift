//
//  CameraView.swift
//  YogaPose
//
//  Created by Lucinda Artahni on 16/05/24.
//

import SwiftUI
import AVKit
import Vision


struct CameraView: UIViewControllerRepresentable {
    @Binding var poseStatus: String
    @Binding var desc: String
    @Binding var navigateToResultScreen: Bool
    
    var model: TadasanaPoseFinal
    @ObservedObject var timer: TimerYoga
    
    func makeUIViewController(context: Context) -> UIViewController {
        let customFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width*0.5, height: UIScreen.main.bounds.height)
        return CameraViewController(poseStatus: $poseStatus, model: model, desc: $desc, timer: timer, previewFrame: customFrame, navigateToResultScreen: $navigateToResultScreen)
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

