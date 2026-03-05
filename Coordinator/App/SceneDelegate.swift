import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Stored Properties

    var window: UIWindow?
    private var appCoordinator: AppCoordinator?

    // MARK: - Delegate Methods

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let appWindow = UIWindow(windowScene: windowScene)

        let coordinator = AppCoordinator(window: appWindow)
        appCoordinator = coordinator
        coordinator.start(animated: true)

        self.window = appWindow
    }
}

