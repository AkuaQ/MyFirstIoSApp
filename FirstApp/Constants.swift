import Foundation

struct Constants {
    struct Storyboard {
        static let homeViewController = "HomeViewController"
        static  let recipeDetailViewController = "RecipeDetailViewController"
    }

    static func isPasswordValid(_ password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                    "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
