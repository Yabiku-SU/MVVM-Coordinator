import UIKit

struct AlertAction {
    let title: String
    let style: UIAlertAction.Style
    let handler: (() -> Void)?

    static func `default`(
        _ title: String = "Ok",
        handler: (() -> Void)? = nil
    ) -> AlertAction {
        AlertAction(title: title, style: .default, handler: handler)
    }

    static func cancel(
        _ title: String = "Cancel",
        handler: (() -> Void)? = nil
    ) -> AlertAction {
        AlertAction(title: title, style: .cancel, handler: handler)
    }

    static func destructive(
        _ title: String,
        handler: (() -> Void)? = nil
    ) -> AlertAction {
        AlertAction(title: title, style: .destructive, handler: handler)
    }
}

extension Coordinator {

    func presentAlert(
        title: String?,
        message: String?,
        actions: [AlertAction] = [
            .default(),
            .destructive("Done")
        ],
        preferredStyle: UIAlertController.Style = .alert
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)

        actions.forEach { action in
            alert.addAction(
                UIAlertAction(
                    title: action.title,
                    style: action.style,
                    handler: { _ in action.handler?() }
                )
            )
        }

        navigationController.topViewController?.present(alert, animated: true)
    }
}
