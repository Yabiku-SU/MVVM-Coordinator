import UIKit

protocol HistoryRoute: AnyObject {
    func navigateToProfile()
}

protocol HistoryCoordinatorDelegate: AnyObject {
    func showProfileFlow()
}

final class HistoryCoordinator: Coordinator {

    // MARK: - Closures

    var onShowProfile: (() -> Void)?

    // MARK: - Methods

    override func build() -> UIViewController {
        let vc = HistoryViewController(
            viewModel: HistoryViewModel(),
            coordinator: self
        )
        vc.tabBarItem = UITabBarItem(
            title: "History",
            image: UIImage(systemName: "clock"),
            tag: 1
        )
        return vc
    }
}

extension HistoryCoordinator: HistoryRoute {

    func navigateToProfile() {
        onShowProfile?()
    }
}
