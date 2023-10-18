//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Шахова Анастасия on 18.10.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dateTextField.text, let month = monthTextField.text, let year = yearTextField.text else {
            return
        }
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        guard let date = calendar.date(from: dateComponents) else { return }
        let weekDay = dateFormatter.string(from: date)
        let capitalizedWeekdaye = weekDay.capitalized
        resultLabel.text = capitalizedWeekdaye

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

