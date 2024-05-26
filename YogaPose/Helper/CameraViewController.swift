//
//  CameraControllerView.swift
//  YogaPose
//
//  Created by Lucinda Artahni on 17/05/24.
//

import Foundation
import SwiftUI
import AVKit
import Vision



class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    var captureSession: AVCaptureSession!
    var poseStatus: Binding<String>
    var desc: Binding<String>
    var navigateToResultScreen: Binding<Bool>
    var model: TadasanaPoseFinal
    
    var previewFrame: CGRect = .zero
    
    var isProcessingFrames = false
    var frameProcessingTimer: Timer?
    
    @ObservedObject var timer: TimerYoga
    
    
   
    init(poseStatus: Binding<String>, model: TadasanaPoseFinal, desc: Binding<String>, timer: TimerYoga, previewFrame: CGRect, navigateToResultScreen: Binding<Bool>) {
        self.poseStatus = poseStatus
        self.model = model
        self.desc = desc
        self.timer = timer
        self.previewFrame = previewFrame
        self.navigateToResultScreen = navigateToResultScreen
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
        self.startFrameProcessingTimer()
       
        
    }
    
    
    
    func setupCamera() {
        captureSession = AVCaptureSession()
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
              let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        
        captureSession.addInput(input)
       
        let videoOutput = AVCaptureVideoDataOutput()
        
       
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        

        captureSession.addOutput(videoOutput)
        
       
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.connection?.videoOrientation = .landscapeRight
        

        previewLayer.frame = previewFrame

        view.layer.addSublayer(previewLayer)
        
        
        captureSession.startRunning()
        
    }
    
    func startFrameProcessingTimer() {
        isProcessingFrames = true
        timer.start(minutes: 0, seconds: 10)
        frameProcessingTimer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { _ in
            
            self.isProcessingFrames = false
            if self.poseStatus.wrappedValue == "Tadasana Wrong Pose" || self.poseStatus.wrappedValue == "Unknown" {
                DispatchQueue.main.async {
                    self.desc.wrappedValue = "Incorrect pose. Please try again."
                    self.retryFrameProcessing()
                }
            } else if self.poseStatus.wrappedValue == "Tadasana Right Pose" {
                DispatchQueue.main.async {
                    self.desc.wrappedValue = "You're doing great! Hold your position!"
                    self.timer.start(minutes: 0, seconds: 30)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
                        self.navigateToResultScreen.wrappedValue = true
                        
                    }
                }
            }
        }
    }
    
    func retryFrameProcessing() {
        timer.start(minutes: 0, seconds: 6)

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.desc.wrappedValue = "Let's do Pose as below"
            self.captureSession.startRunning()
            self.startFrameProcessingTimer()
            
            
        }
    }
    
   
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
       
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        if self.isProcessingFrames{
            classifyPose(pixelBuffer: pixelBuffer)
           
        }
    }
    
   
    func classifyPose(pixelBuffer: CVPixelBuffer) {
        if isProcessingFrames{
            guard let model = try? VNCoreMLModel(for: self.model.model) else { return }
            
            let request = VNCoreMLRequest(model: model) { (request, error) in
                if let results = request.results as? [VNClassificationObservation],
                   let topResult = results.first {
                    DispatchQueue.main.async {
                        let confidence = topResult.confidence
                        
                        if confidence >= 0.8 {
                            if self.isProcessingFrames{
                                self.poseStatus.wrappedValue = topResult.identifier
                                
                            }
                        }
                        
                    }
                }
            }
            
            let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
            try? handler.perform([request])
        }
    }
    
}
