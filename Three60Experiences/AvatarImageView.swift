//
//  AvatarView.swift
//  Three60Experiences
//
//  Created by Tri Do on 06/03/2022.
//

import Foundation
import UIKit

class AvatarImageView: UIImageView {
    override func layoutSubviews() {
        layer.cornerRadius = bounds.height / 2
    }
}
