import UIKit
import SnapKit

final class HistoryViewController: BaseViewController {

    // MARK: - Layout Properties

    private lazy var historyTitle = UILabel()

    // MARK: - Stored Properties

    private let viewModel: HistoryViewModel
    weak var coordinator: HistoryRoute?

    // MARK: - Initialization

    init(viewModel: HistoryViewModel, coordinator: HistoryRoute) {
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
        view.addSubview(historyTitle)
        historyTitle.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(26)
        }
    }

    private func setupUI() {
        view.backgroundColor = .init(red: 0.89, green: 0.56, blue: 0.91, alpha: 1)

        let profileItem = UIBarButtonItem(
            image: UIImage(systemName: "person.crop.circle"),
            style: .plain,
            target: self,
            action: #selector(onProfileButtonTapped)
        )
        navigationItem.rightBarButtonItem = profileItem

        historyTitle.text = "History screen"
        historyTitle.textColor = .black
        historyTitle.textAlignment = .center
    }

    // MARK: - Actions

    @objc private func onProfileButtonTapped() {
        coordinator?.navigateToProfile()
    }
}
