import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?

    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue  = weight / pow(height, height)
        let color: UIColor
        let advice: String
        
        if bmiValue < 18.5 {
            advice = "Eat more pies!"
            color = .blue
        } else if bmiValue >= 18.5 &&  bmiValue < 24.9 {
            advice = "Fit as a fiddle!"
            color = .green
        } else {
            advice = "Eat less pies!"
            color = .purple
        }
        
        bmi = BMI(value: bmiValue, advice: advice, color: color)
    }
}
