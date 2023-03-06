// UIViewController+Extension.swift
// Copyright © Alexandr T. All rights reserved.

import UIKit

/// Добавление Alert об ошибке
extension UIViewController {
    // MARK: - Public Methods

    func showErrorAlert(alertTitle: String?, message: String?, actionTitle: String?) {
        let errorAlertController = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let okErrorAlertControllerAction = UIAlertAction(title: actionTitle, style: .cancel)
        errorAlertController.addAction(okErrorAlertControllerAction)
        present(errorAlertController, animated: true)
    }
}
