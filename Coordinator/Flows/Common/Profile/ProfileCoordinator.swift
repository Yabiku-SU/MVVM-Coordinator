import UIKit

protocol ProfileRoute: AnyObject {
    func presentSuccessAlert()
    func presentErrorAlert()
    func didLogOut()
}

final class ProfileCoordinator: Coordinator {

    // MARK: - Delegates

    weak var flowDelegate: AppCoordinatorFlowDelegate?

    // MARK: - Methods

    override func build() -> UIViewController {
        return ProfileViewController(
            viewModel: ProfileViewModel(),
            coordinator: self
        )
    }
}

extension ProfileCoordinator: ProfileRoute {

    func presentSuccessAlert() {
        presentAlert(
            title: "Success",
            message: "Success message presented from Profile",
            actions: [
                .default(),
            ]
        )
    }
    
    func presentErrorAlert() {
        presentAlert(
            title: "Error",
            message: "Error message presented from Profile",
            actions: [
                .destructive("Close", handler: { [weak self] in
                    self?.pop()
                }),
                .default()
            ]
        )
    }

    func didLogOut() {
        flowDelegate?.didLogOut()
    }
}
