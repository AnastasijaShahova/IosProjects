//
//  SecondViewController.swift
//  GCD
//
//  Created by Шахова Анастасия on 30.10.2023.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        
        get {
            return imageView.image
        }
        
        set {
            loadIndicator.isHidden = true
            loadIndicator.startAnimating()
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchImage()
        delay(3) {
            self.loginAlert()
        }
    }
    
    fileprivate func delay(_ delay: Int, closure: @escaping() -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    
    fileprivate func loginAlert() {
        let ac = UIAlertController(title: "Любишь баскетбол?", message: "", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Да", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Нет", style: .default, handler: nil)
        ac.addAction(okAction)
        ac.addAction(cancelAction)

        
        self.present(ac, animated: true, completion: nil)
    }
    
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")
        loadIndicator.isHidden = false
        loadIndicator.startAnimating()
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url)  else {return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
           
        }
    }
    

}
