//
//  Step.swift
//  YogaPose
//
//  Created by Lucinda Artahni on 22/05/24.
//

import Foundation

struct Step: Identifiable{
    var id: UUID
    var stepNum: Int
    var image: String
    var desc: String
    
}

let steps: [Step] = [
    Step(id: UUID(), stepNum: 1, image: "Step1", desc: "Try to match the pose shown!"),
    Step(id: UUID(), stepNum: 2, image: "Step2", desc: "Using the camera, we'll check your pose and keep trying until it's correct!"),
    Step(id: UUID(), stepNum: 3, image: "Step3", desc: "Hold your pose until the countdown finishes!")
]
