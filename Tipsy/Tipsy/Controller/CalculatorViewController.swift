import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var countLabel: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    
    var tips = 0.0
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let tipsTitle = sender.currentTitle!
        tips = Double(String(tipsTitle.dropLast()))! / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitLabel.text = Int(sender.value).description
        //numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = countLabel.text!
                
        if bill != "" {
            billTotal = Double(bill)!
            let res = billTotal * (1 + tips) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", res)
        }
        
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.tip = Int(tips * 100)
            destinationVC.split = numberOfPeople
            destinationVC.billTotal = finalResult
        }
    }
    
    
}

