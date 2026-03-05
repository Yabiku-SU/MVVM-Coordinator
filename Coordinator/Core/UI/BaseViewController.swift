import UIKit

class BaseViewController: UIViewController {

    // MARK: - Stored Properties

    var preferredNavigationBarHidden: Bool {
        false
    }

    // MARK: - Override Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}
