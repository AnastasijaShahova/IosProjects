
import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var celLabel: UILabel!
    @IBOutlet weak var slider: UISlider! {
        didSet {
            slider.maximumValue = 100
            slider.minimumValue = 0
            slider.value = 0
            slider.tintColor = .black
        }
    }
    
    @IBOutlet weak var farLabel: UILabel!
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let tempretureCelsiud = Int(round(sender.value))
        let tempretureFaringeit = Int(round((sender.value * 9 / 5) + 32))
        celLabel.text = "\(tempretureCelsiud)ºC"
        farLabel.text = "\(tempretureFaringeit)ºF"
        
    }
    
}

