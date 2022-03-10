//
//  DataManager.swift
//  Three60Experiences
//
//  Created by Tri Do on 20/02/2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    func getData() -> [Experience] {
        return [Experience(imageUrl: "https://xctuality.com/assets/img/2.3cf0375.png", link: "https://artpodium.com.sg/arts-access-appreciation-show/"),
                Experience(imageUrl: "https://xctuality.com/assets/img/cny-cover-image.c9375ad.png", link: "https://cny2021-archive-lantern-walk.xctuality.com/"),
                Experience(imageUrl: "https://xctuality.com/assets/img/image%20(1).a5a2bff.png", link: "https://web.xctuality.com/360/mrworld-360/index.htm"),
                Experience(imageUrl: "https://xctuality.com/assets/img/main-poster.c597d1c.jpeg", link: "https://artwalk-singapore.xctuality.com/"),
                Experience(imageUrl: "https://xctuality.com/assets/img/Opening%20Title%201.9afd2e3.jpg", link: "https://web.xctuality.com/360/mamc-demo/index.htm"),
                Experience(imageUrl: "https://xctuality.com/assets/img/Walking%20w%20Photographers%20Opening%20(2).babd584.png", link: "https://web.xctuality.com/360/wwp-robert-zhao/index.htm"),
                Experience(imageUrl: "https://xctuality.com/assets/img/heritage-walk-cny-cover-image.362572a.png", link: "https://cny2021-archive-heritage-trail.xctuality.com/"),
                Experience(imageUrl: "https://xctuality.com/assets/img/image%20(2).646236e.png", link: "https://web.xctuality.com/360/substation-hereafter/index.htm"),
                Experience(imageUrl: "https://xctuality.com/assets/img/Walking%20w%20Photographers%20Opening%20(1).a2a8bfd.jpg", link: "https://web.xctuality.com/360/wwp-lavender-chang/index.htm"),
                Experience(imageUrl: "https://xctuality.com/assets/img/POWER-PLAY-LOGOS-white.9ad1e85.png", link: "https://powerplay.xctuality.com/"),
                Experience(imageUrl: "https://xctuality.com/assets/img/image.ef739e9.png", link: "https://web.xctuality.com/one-play/spl-006/index.htm")]
    }
}
