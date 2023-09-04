import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayResultLabel: UILabel!
    var stillTyping = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    var dotIsPressed = false
    var currentImput: Double  {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            
            if valueArray[1] == "0" {
                displayResultLabel.text = "\(valueArray[0])"
            } else {
                displayResultLabel.text = "\(newValue)"
            }
            
            stillTyping = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
    
        if stillTyping {
            if displayResultLabel.text!.count < 10 {
                
                displayResultLabel.text = displayResultLabel.text! + number
            }
        } else {
            
            displayResultLabel.text = number
            stillTyping = true
        }
        
        animationForButton(sender)
    }
    
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentImput
        stillTyping = false
        dotIsPressed = false
        
        animationForButton(sender)
    }
    
    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentImput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    
    @IBAction func equalitySignPressed(_ sender: UIButton) {
        if stillTyping {
            secondOperand = currentImput
        }
        
        dotIsPressed = false
        
        switch operationSign {
        case "+":
            operateWithTwoOperands{$0 + $1}
        case "-":
            operateWithTwoOperands{$0 - $1}
        case "×":
            operateWithTwoOperands{$0 * $1}
        case "÷":
            operateWithTwoOperands{$0 / $1}
        default: break
        }
        animationForButton(sender)
    }
    
    @IBAction func persentPressed(_ sender: UIButton) {
        if firstOperand == 0 {
            currentImput = currentImput / 100
        } else {
            secondOperand = firstOperand * currentImput / 100
        }
        
        animationForButton(sender)
    }
    
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        currentImput = -currentImput
        
        animationForButton(sender)
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentImput = 0
        displayResultLabel.text = "0"
        operationSign = ""
        stillTyping = false
        dotIsPressed = false
        
        animationForButton(sender)
    }
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if stillTyping && !dotIsPressed {
            displayResultLabel.text = displayResultLabel.text! + "."
        } else if !stillTyping && !dotIsPressed{
            displayResultLabel.text = "0."
            stillTyping = true
        }
        dotIsPressed = true
        
        animationForButton(sender)
    }
    
    func animationForButton(_ sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            sender.alpha = 1.0
        }
    }
}

