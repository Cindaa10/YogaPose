import Foundation
import CreateML
import CreateMLComponents

let data = try MLImageClassifier.DataSource.labeledDirectories(at: URL(fileURLWithPath: "/Users/lucindaartahni/Downloads/YogaPoseDataset"))
let classifier = try MLImageClassifier(trainingData: data)
let evaluation = classifier.evaluation(on: data)
print(evaluation)

//let modelURL = URL(fileURLWithPath: "/path/to/YogaPoseClassifier.mlmodel")
//try classifier.write(to: modelURL)


