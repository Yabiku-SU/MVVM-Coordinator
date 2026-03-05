import UIKit

protocol AppCoordinatorFlowDelegate: AnyObject {
    func didLogIn()
    func didLogOut()
}

final class AppCoordinator {

    enum AppFlow {
        case auth
        case main
    }

    // MARK: - Stored Properties

    private let window: UIWindow

    private var isLoggedIn: Bool {
        UserDefaults.standard.bool(forKey: "isLoggedIn")
    }

    private var activeFlow: (flow: AppFlow, coordinator: Coordinator)?

    // MARK: - Initialization

    init(window: UIWindow) {
        self.window = window
    }

    // MARK: - Overrides

    func start(animated: Bool) {
        transition(to: isLoggedIn ? .main : .auth)
    }

    // MARK: - Private Methods

    private func transition(to newFlow: AppFlow) {
        guard activeFlow?.flow != newFlow else { return }

        activeFlow = nil

        let navigationController = UINavigationController()
        let coordinator: Coordinator

        switch newFlow {
        case .auth:
            let auth = AuthCoordinator(navigationController: navigationController)
            auth.flowDelegate = self
            coordinator = auth
        case .main:
            let main = MainCoordinator(navigationController: navigationController)
            main.flowDelegate = self
            coordinator = main
        }

        coordinator.start(animated: false)

        UIView.transition(
            with: window,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: {
                self.window.rootViewController = navigationController
                self.window.makeKeyAndVisible()
            }
        )

        activeFlow = (newFlow, coordinator)
    }
}

extension AppCoordinator: AppCoordinatorFlowDelegate {

    func didLogIn() {
        transition(to: .main)
    }

    func didLogOut() {
        transition(to: .auth)
    }
}
