/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Model object representing a single person.
*/

import Foundation

struct User: Codable {
    let name: String
    let username: String
    let avatar: String
}
