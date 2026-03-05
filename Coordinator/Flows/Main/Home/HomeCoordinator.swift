import UIKit

protocol HomeRoute: AnyObject {
    func navigateToProfile()
    func navigateToDetails(with title: String)
}

final class HomeCoordinator: Coordinator {

    // MARK: - Closures

    var onShowProfile: (() -> Void)?

    // MARK: - Methods

    override func build() -> UIViewController {
        let vc = HomeViewController(
            viewModel: HomeViewModel(),
            coordinator: self
        )
        vc.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            tag: 0
        )
        return vc
    }
}

extension HomeCoordinator: HomeRoute {

    func navigateToProfile() {
        onShowProfile?()
    }

    func navigateToDetails(with title: String) {
        let vc = DetailsViewController(
            viewModel: DetailsViewModel(),
            coordinator: self
        )
        vc.hidesBottomBarWhenPushed = true
        push(vc)
    }
}
