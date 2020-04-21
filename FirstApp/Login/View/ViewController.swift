import UIKit
import Dev_Pod

class ViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
       let gradientLayer = CAGradientLayer()
           var updatedFrame = self.navigationController!.navigationBar.bounds
           updatedFrame.size.height += self.navigationController!.navigationBar.frame.height
           gradientLayer.frame = updatedFrame
           gradientLayer.colors = [UIColor(red: 75/255,
                                           green: 29/255,
                                           blue: 87/255, alpha: 1).cgColor, UIColor(red: 152/255,
                                                                                    green: 103/255,
                                                                                    blue: 163/255, alpha: 1).cgColor]
           gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0) // vertical gradient start
           gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0) // vertical gradient end
           UIGraphicsBeginImageContext(gradientLayer.bounds.size)
           gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
           let image = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
       self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
    }

    func setUpElements() {
        //Style the elements
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
        Utilities.styleFilledButton(loginButton)
        Utilities.styleFilledButton(signUpButton)
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        AnalyticsLoginRepo.landingPageLoginTapped()
    }

    @IBAction func signUpButton(_ sender: UIButton) {
        AnalyticsLoginRepo.landingPageSignUpTapped()
    }
}
