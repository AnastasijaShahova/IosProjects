import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballImageView: UIImageView!
    @IBOutlet weak var askButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIComponents()
    }
    
    private func setUpUIComponents() {
        askButton.layer.cornerRadius = 10
    }
    
    let ballArray: Array<UIImage> = [UIImage(named: "ball1")!, UIImage(named: "ball2")!, UIImage(named: "ball3")!, UIImage(named: "ball4")!, UIImage(named: "ball5")! ]
    
    @IBAction func askButtonPressed(_ sender: UIButton) {
        ballImageView.image = ballArray[Int.random(in: 0..<ballArray.count)]
    }



}

