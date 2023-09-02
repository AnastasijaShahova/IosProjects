import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    let arrayImagesDice: Array<UIImage> = [ UIImage(named: "DiceOne")!, UIImage(named: "DiceTwo")!, UIImage(named: "DiceThree")!, UIImage(named: "DiceFour")!, UIImage(named: "DiceFive")!, UIImage(named: "DiceSix")! ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func rollButton(_ sender: UIButton) {

        diceImageViewOne.image = arrayImagesDice[Int.random(in: 0..<arrayImagesDice.count)]
        diceImageViewTwo.image = arrayImagesDice[Int.random(in: 0..<arrayImagesDice.count)]
    }


}

