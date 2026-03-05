import UIKit
import SnapKit

class HomeViewController: BaseViewController {

    // MARK: - Layout Properties

    private lazy var detailsButton = UIButton(type: .system)

    // MARK: - Stored Properties

    private let viewModel: HomeViewModel
    weak var coordinator: HomeRoute?

    // MARK: - Initialization

    init(viewModel: HomeViewModel, coordinator: HomeRoute) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
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
        view.addSubview(detailsButton)
        detailsButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(26)
            make.height.equalTo(44)
        }
    }

    private func setupUI() {
        view.backgroundColor = .init(red: 0.56, green: 0.81, blue: 0.91, alpha: 1)

        let profileItem = UIBarButtonItem(
            image: UIImage(systemName: "person.crop.circle"),
            style: .plain,
            target: self,
            action: #selector(onProfileButtonTapped)
        )
        navigationItem.rightBarButtonItem = profileItem

        detailsButton.backgroundColor = .white
        detailsButton.setTitle("Go to Details", for: .normal)
        detailsButton.setTitleColor(.black, for: .normal)
        detailsButton.addTarget(self, action: #selector(onDetailsButtonTapped), for: .touchUpInside)
        detailsButton.layer.cornerRadius = 16
    }

    // MARK: - Actions

    @objc private func onProfileButtonTapped() {
        coordinator?.navigateToProfile()
    }

    @objc private func onDetailsButtonTapped() {
        coordinator?.navigateToDetails(with: "Details screen")
    }
}
