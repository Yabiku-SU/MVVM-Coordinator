import Foundation

protocol AuthViewModelDelegate: AnyObject {
    func didLogIn()
}

final class AuthViewModel {

    // MARK: - Delegates

    weak var viewModelDelegate: AuthViewModelDelegate?

    // MARK: - Methods

    func login() {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        viewModelDelegate?.didLogIn()
    }
}
