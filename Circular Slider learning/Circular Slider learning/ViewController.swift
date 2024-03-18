//
//  ViewController.swift
//  Circular Slider learning
//
//  Created by Israkul Hoque bs23 on 13/3/24.
//

import UIKit

class ViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    let SliderView = UIView()
    
    var initialLocation: CGPoint = .zero
    var previousLocation: CGPoint = .zero
    var progress: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SliderView.frame = CGRect(x: 0, y: 0, width: 240, height: 240)
        SliderView.center = view.center
        view.addSubview(SliderView)
        
        makeSlider()
        
       // let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
      //  SliderView.addGestureRecognizer(panGesture)
        
        view.backgroundColor = .white
    }
    
    // Assuming you have a setup method where you initialize your slider and its progress
    


    
    func makeSlider() {
        let center = SliderView.center
        
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 120, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.lineWidth = 40
        trackLayer.lineCap = .round
        trackLayer.strokeColor = UIColor.green.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.position = SliderView.center
        
        view.layer.addSublayer(trackLayer)
        
//        shapeLayer.path = circularPath.cgPath
//        shapeLayer.lineWidth = 30
//        shapeLayer.strokeEnd = 0
//        shapeLayer.lineCap = .round
//        shapeLayer.position = SliderView.center
//        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
//        shapeLayer.strokeColor = UIColor(red: 34/255, green: 184/255, blue: 255/255, alpha: 1).cgColor
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        view.layer.addSublayer(shapeLayer)
    }
    
    
//    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
//        let location = gestureRecognizer.location(in: view)
//        let center = SliderView.center
//
//        // Angle calculation (ensure full range):
//        var angle = atan2(location.y - center.y, location.x - center.x) + CGFloat.pi / 2
//        if angle < 0 {
//            angle += 2 * CGFloat.pi // Ensure angle is positive
//        }
//
//        // Update shapeLayer directly based on normalized angle
//        let normalizedAngle = angle / (2 * CGFloat.pi)
//        
//        if normalizedAngle >= 1.0 {
//            shapeLayer.strokeEnd = 0.0 // Reset to 0 when reaching 1
//        } else {
//            shapeLayer.strokeEnd = normalizedAngle
//        }
//
//        // Update color and value based on normalized angle (optional)
//        shapeLayer.strokeColor = calculateProgressColor(value: shapeLayer.strokeEnd).cgColor
//
//        // Implement value change logic here
//        let value = shapeLayer.strokeEnd // 0.0 (top) to 1.0 (bottom)
//        // ... (e.g., update a label, perform actions based on value)
//        print(value)
//    }

    
    // working
    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        let location = gestureRecognizer.location(in: view)
        let center = SliderView.center

        // Angle calculation (ensure full range):
        var angle = atan2(location.y - center.y, location.x - center.x) + CGFloat.pi / 2
        if angle < 0 {
            angle += 2 * CGFloat.pi // Ensure angle is positive
        }

        // Update shapeLayer directly based on normalized angle
        shapeLayer.strokeEnd = angle / (2 * CGFloat.pi)

        // Update color and value based on normalized angle (optional)
        shapeLayer.strokeColor = calculateProgressColor(value: shapeLayer.strokeEnd).cgColor

        // Implement value change logic here
        let value = shapeLayer.strokeEnd // 0.0 (top) to 1.0 (bottom)
        // ... (e.g., update a label, perform actions based on value)
        
        print(value)
    }



    func calculateProgressColor(value: CGFloat) -> UIColor {
      let startColor = CIColor(color: UIColor.green)
      let endColor = CIColor(color: UIColor.blue)

      // Blend colors based on progress (0-1)
        let blendedColor = UIColor.systemCyan.cgColor

      // Convert back to UIColor
      return UIColor(cgColor: blendedColor)
    }


    
    
    
}


/*
class ViewController: UIViewController {
     let shapeLayer = CAShapeLayer()
    
    
    @IBOutlet var SliderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSlider()
    }
    
    func makeSlider()
      {
          let center = SliderView.center
    
          let trackLayer = CAShapeLayer()
          
          let circularPath = UIBezierPath(arcCenter: .zero, radius: 120, startAngle: 0, endAngle: 2 * CGFloat(Double.pi), clockwise: true)
          
          trackLayer.path = circularPath.cgPath
          trackLayer.lineWidth = 40
          trackLayer.lineCap = .round
          trackLayer.strokeColor = UIColor.green.cgColor
          trackLayer.fillColor = UIColor.clear.cgColor
          trackLayer.position = SliderView.center
          
          
          view.layer.addSublayer(trackLayer)
          
          shapeLayer.path = circularPath.cgPath
          shapeLayer.lineWidth = 50
          shapeLayer.strokeEnd = 0
          shapeLayer.lineCap = .round
          shapeLayer.position = SliderView.center
          shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
          shapeLayer.strokeColor = CGColor(srgbRed: 34/255, green: 184/255, blue: 255/255, alpha: 1)
          shapeLayer.fillColor = UIColor.clear.cgColor
          view.layer.addSublayer(shapeLayer)
          
      }


    func startFillAnimation(){
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        var total: Double!
        var free: Double!
        
        
        
        
        
        // persentageLabel.text = "\(rest)"
        basicAnimation.toValue = 0.90
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
}
*/



// Extension for clamping values (optional)
class ClampingHelper {
  static func clamp(value: CGFloat, to range: ClosedRange<CGFloat>) -> CGFloat {
    return min(max(value, range.lowerBound), range.upperBound)
  }
}


//
//@objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
//    let location = gestureRecognizer.location(in: view)
//    let center = SliderView.center
//
//    // **Angle calculation (ensure full range):**
//    let angle = atan2(location.y - center.y, location.x - center.x) + CGFloat.pi / 2
//    let normalizedAngle = fmod(angle, 2 * CGFloat.pi) // Normalize angle (0-2π)
//
//    // **Optional: Use UIRotationGestureRecognizer for finer control (not shown here)**
//
//    // Update shapeLayer directly based on normalized angle
//    shapeLayer.strokeEnd = normalizedAngle / (2 * CGFloat.pi)
//
//    // Update color and value based on normalized angle (optional)
//    shapeLayer.strokeColor = calculateProgressColor(value: shapeLayer.strokeEnd).cgColor
//
//    // Implement value change logic here
//    let value = shapeLayer.strokeEnd // 0.0 (top) to 1.0 (bottom)
//    // ... (e.g., update a label, perform actions based on value)
//}
