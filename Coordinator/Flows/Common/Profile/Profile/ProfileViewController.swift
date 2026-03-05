import UIKit
import SnapKit

class ProfileViewController: BaseViewController {

    // MARK: - Layout Properties

    private lazy var successAlertButton = UIButton(type: .system)
    private lazy var errorAlertButton = UIButton(type: .system)
    private lazy var logOutButton = UIButton(type: .system)

    override var preferredNavigationBarHidden: Bool { false }

    // MARK: - Stored Properties

    private let viewModel: ProfileViewModel
    weak var coordinator: ProfileRoute?

    // MARK: - Initialization

    init(viewModel: ProfileViewModel, coordinator: ProfileRoute) {
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
        view.addSubview(successAlertButton)
        view.addSubview(errorAlertButton)
        view.addSubview(logOutButton)

        successAlertButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(26)
            make.height.equalTo(44)
        }
        errorAlertButton.snp.makeConstraints { make in
            make.top.equalTo(successAlertButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(26)
            make.height.equalTo(44)
        }
        logOutButton.snp.makeConstraints { make in
            make.top.equalTo(errorAlertButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(26)
            make.height.equalTo(44)
        }
    }

    private func setupUI() {
        view.backgroundColor = .init(red: 0.56, green: 0.81, blue: 0.91, alpha: 1)

        setupButton(successAlertButton, title: "Show success")
        setupButton(errorAlertButton, title: "Show error")
        setupButton(logOutButton, title: "Logout")
        successAlertButton.addTarget(self, action: #selector(onSuccessAlertButtonTapped), for: .touchUpInside)
        errorAlertButton.addTarget(self, action: #selector(onErrorAlertButtonTapped), for: .touchUpInside)
        logOutButton.addTarget(self, action: #selector(onLogoutButtonTapped), for: .touchUpInside)
    }

    private func setupButton(_ button: UIButton, title: String) {
        button.backgroundColor = .white
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 16
    }

    // MARK: - Actions

    @objc private func onSuccessAlertButtonTapped() {
        coordinator?.presentSuccessAlert()
    }

    @objc private func onErrorAlertButtonTapped() {
        coordinator?.presentErrorAlert()
    }

    @objc private func onLogoutButtonTapped() {
        viewModel.logout()
    }
}

extension ProfileViewController: ProfileViewModelDelegate {

    func didLogOut() {
        coordinator?.didLogOut()
    }
}
