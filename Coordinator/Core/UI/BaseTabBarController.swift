import UIKit

class BaseTabBarController: UITabBarController {

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Setup Methods

    private func setupUI() {
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        tabBar.clipsToBounds = false
        tabBar.isTranslucent = false

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
    }
}
