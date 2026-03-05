import UIKit

class Coordinator: NSObject {

    // MARK: - Stored Properties

    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private weak var rootViewController: UIViewController?

    // MARK: - Initialization

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }

    deinit {
        print("\(self) deinit")
    }

    // MARK: - Methods

    func start(animated: Bool = true) {
        let vc = build()
        rootViewController = vc
        push(vc, animated: animated)
    }

    func build() -> UIViewController {
        fatalError("Override build() in subclass")
    }

    func finish() {
        parentCoordinator?.removeChild(self)
    }

    func addChild(_ child: Coordinator) {
        childCoordinators.append(child)
    }

    func removeChild(_ child: Coordinator) {
        childCoordinators.removeAll { $0 === child }
    }
}

extension Coordinator {

    func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }

    func popTo(to viewController: UIViewController, animated: Bool = true) {
        navigationController.popToViewController(viewController, animated: animated)
    }

    func push(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }
}


extension Coordinator: UINavigationControllerDelegate {

    func navigationController(
        _ navigationController: UINavigationController,
        willShow viewController: UIViewController,
        animated: Bool
    ) {
        let hidden = (viewController as? BaseViewController)?.preferredNavigationBarHidden ?? true
        navigationController.setNavigationBarHidden(hidden, animated: animated)
    }

    func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    ) {
        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        guard !navigationController.viewControllers.contains(fromVC) else { return }

        if fromVC === rootViewController {
            finish()
        }
    }
}
