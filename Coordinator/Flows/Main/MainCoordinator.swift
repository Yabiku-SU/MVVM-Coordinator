import UIKit

final class MainCoordinator: Coordinator {

    // MARK: - Stored Properties

    private let tabBarController = BaseTabBarController()

    // MARK: - Delegates

    weak var flowDelegate: AppCoordinatorFlowDelegate?

    // MARK: - Methods

    override func build() -> UIViewController {
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        homeCoordinator.parentCoordinator = self
        homeCoordinator.onShowProfile = { [weak self] in
            self?.showProfileFlow()
        }
        homeCoordinator.start()
        addChild(homeCoordinator)

        let historyNavigationController = UINavigationController()
        let historyCoordinator = HistoryCoordinator(navigationController: historyNavigationController)
        historyCoordinator.parentCoordinator = self
        historyCoordinator.onShowProfile = { [weak self] in
            self?.showProfileFlow()
        }
        historyCoordinator.start()
        addChild(historyCoordinator)

        tabBarController.setViewControllers(
            [
                homeNavigationController,
                historyNavigationController,
            ],
            animated: true
        )

        navigationController.setNavigationBarHidden(true, animated: true)
        return tabBarController
    }

    private func showProfileFlow() {
        let coordinator = ProfileCoordinator(navigationController: navigationController)
        coordinator.flowDelegate = flowDelegate
        coordinator.parentCoordinator = self
        coordinator.start(animated: true)
        addChild(coordinator)
    }
}
