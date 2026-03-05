import Foundation

protocol ProfileViewModelDelegate: AnyObject {
    func didLogOut()
}

final class ProfileViewModel {

    // MARK: - Delegates

    weak var viewModelDelegate: ProfileViewModelDelegate?

    // MARK: - Methods

    func logout() {
        UserDefaults.standard.removeObject(forKey: "isLoggedIn")
        viewModelDelegate?.didLogOut()
    }
}
