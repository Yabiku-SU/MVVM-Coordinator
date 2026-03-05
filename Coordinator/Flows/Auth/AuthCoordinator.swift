import UIKit

protocol AuthRoute: AnyObject {
    func didLogin()
}

final class AuthCoordinator: Coordinator {

    // MARK: - Delegates

    weak var flowDelegate: AppCoordinatorFlowDelegate?

    // MARK: - Methods

    override func build() -> UIViewController {
        return AuthViewController(
            viewModel: AuthViewModel(),
            coordinator: self
        )
    }
}

extension AuthCoordinator: AuthRoute {

    func didLogin() {
        flowDelegate?.didLogIn()
    }
}
