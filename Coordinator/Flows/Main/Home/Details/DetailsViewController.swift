import UIKit
import SnapKit

class DetailsViewController: BaseViewController {

    // MARK: - Layout Properties

    private lazy var detailsTitle = UILabel()

    // MARK: - Stored Properties

    private let viewModel: DetailsViewModel
    weak var coordinator: HomeRoute?

    // MARK: - Initialization

    init(viewModel: DetailsViewModel, coordinator: HomeRoute) {
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
        view.addSubview(detailsTitle)
        detailsTitle.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(26)
        }
    }

    private func setupUI() {
        view.backgroundColor = .init(red: 0.89, green: 0.56, blue: 0.91, alpha: 1)

        detailsTitle.text = "Details screen"
        detailsTitle.textColor = .black
        detailsTitle.textAlignment = .center
    }
}
