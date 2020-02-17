import Foundation
import UIKit

class Utilities {
    static func styleTextField(_ textfield: UITextField) {
        // Create the bottom line
        /*let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 7, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.init(red: 200/255, green: 135/255, blue: 215/255, alpha: 1).cgColor
        // Remove border on text field
        textfield.borderStyle = .none
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)*/
        // Remove border on text field
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.init(red: 200/255, green: 135/255, blue: 215/255, alpha: 1).cgColor
        textfield.layer.cornerRadius = 6
    }
    static func styleFilledButton(_ button: UIButton) {
        // Filled rounded corner style
        button.layer.cornerRadius = 6
    }
    static func styleHollowButton(_ button: UIButton) {
        // Hollow rounded corner style
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.init(red: 200/255, green: 135/255, blue: 215/255, alpha: 1).cgColor
        button.layer.cornerRadius = 6
    }
    static func styleErrorTextField(_ textfield: UITextField) {
        // Hollow rounded corner style
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.red.cgColor
        textfield.layer.cornerRadius = 6
    }
}
