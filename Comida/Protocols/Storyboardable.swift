//
//  Storyboardable.swift
//  Comida
//
//  Created by Jose Martin Salcedo on 19/09/21.
//

import Foundation
import UIKit

protocol Storyboardable {
//    MARK: - Properties
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }

    static var storyboardIdentifier: String { get }

    // MARK: - Methods

    static func instantiate() -> Self
}

extension Storyboardable where Self: UIViewController {

    // MARK: - Properties

    static var storyboardName: String {
        return String(describing: self)
    }

    static var storyboardBundle: Bundle {
        return .main
    }

    static var storyboardIdentifier: String {
        return String(describing: self)
    }

    // MARK: - Methods
    static func instantiate() -> Self {
        guard let viewController = UIStoryboard(name: storyboardName, bundle: storyboardBundle).instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Unable to Instantiate View Controller With Storyboard Identifier \(storyboardIdentifier)")
        }
        return viewController
    }

}
