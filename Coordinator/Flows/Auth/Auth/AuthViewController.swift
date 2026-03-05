import UIKit
import SnapKit

class AuthViewController: BaseViewController {

    // MARK: - Layout Properties

    private lazy var loginButton = UIButton(type: .system)
    override var preferredNavigationBarHidden: Bool { true }

    // MARK: - Stored Properties

    private var viewModel: AuthViewModel
    weak var coordinator: AuthRoute?

    // MARK: - Initialization

    init(viewModel: AuthViewModel, coordinator: AuthRoute) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        self.viewModel.viewModelDelegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupUI()
    }

    // MARK: - Setup Methods

    private func setupLayout() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(26)
            make.height.equalTo(44)
        }
    }

    private func setupUI() {
        view.backgroundColor = .init(red: 0.74, green: 0.91, blue: 0.56, alpha: 1)

        loginButton.backgroundColor = .white
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.addTarget(self, action: #selector(onLoginButtonTapped), for: .touchUpInside)
        loginButton.layer.cornerRadius = 16
    }

    // MARK: - Actions

    @objc func onLoginButtonTapped() {
        viewModel.login()
    }
}

extension AuthViewController: AuthViewModelDelegate {

    func didLogIn() {
        coordinator?.didLogin()
    }
}
