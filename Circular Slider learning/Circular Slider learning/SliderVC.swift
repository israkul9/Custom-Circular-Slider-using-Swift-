//
//  SliderVC.swift
//  Circular Slider learning
//
//  Created by Israkul Hoque bs23 on 14/3/24.
//

import UIKit




class SliderVC: UIViewController {
  
    @IBOutlet weak var FirstSlider: CircularSlider!
    
    @IBOutlet weak var SecondSlider: CircularSlider!
    
//    @IBOutlet weak var secondSlider: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        SecondSlider.layer.cornerRadius = SecondSlider.bounds.width/2
        SecondSlider.clipsToBounds = true
        FirstSlider.clipsToBounds = true
      
        setupFirstSlider()
        setupSecondSlider()
    
    }
    
    
    func setupSecondSlider(){
        SecondSlider.diskFillColor = .clear
        SecondSlider.diskColor = .clear
        SecondSlider.trackColor = UIColor.init(hexString: "#f8f4f4")
        SecondSlider.trackFillColor = .systemTeal
        SecondSlider.minimumValue = 0
        SecondSlider.maximumValue = 1
        SecondSlider.lineWidth = 40
        SecondSlider.backtrackLineWidth = 60
        SecondSlider.endPointValue = 0.45
        SecondSlider.endThumbImage = UIImage(named: "Wake")
    }
    
    func setupFirstSlider(){
        
        FirstSlider.diskFillColor = .clear
        FirstSlider.diskColor = .clear
        FirstSlider.trackColor = UIColor.init(hexString: "#f8f4f4")
        FirstSlider.trackFillColor = .yellow
        FirstSlider.minimumValue = 0
        FirstSlider.maximumValue = 1
        FirstSlider.lineWidth = 45
        FirstSlider.backtrackLineWidth = 50
        FirstSlider.endPointValue = 0.3
        
        FirstSlider.endThumbImage = UIImage(named: "Wake")
        
       // FirstSlider.endThumbStrokeHighlightedColor = .red
        
        updateTexts()
        FirstSlider.addTarget(self, action: #selector(updateTexts), for: .valueChanged)
        
    }
    
   @objc func updateTexts (){
       print(FirstSlider.endPointValue)
       
//       if FirstSlider.endPointValue > 0.5 {
//           FirstSlider.trackFillColor = .orange
//       }
//       else {
//           FirstSlider.trackFillColor = .systemYellow
//       }
    }

   
 
}



extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
