//
//  Common.swift
//  Three60Experiences
//
//  Created by Tri Do on 01/03/2022.
//

import Foundation
import UIKit

class Common {
    static private(set) var shared = Common()
    func showAlert(message: String, parent: UIViewController) {
        let controller = UIAlertController(title: "", message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        parent.present(controller, animated: true, completion: nil)
    }
}
