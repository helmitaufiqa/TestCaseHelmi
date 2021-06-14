//
//  CarouselModel.swift
//  TestCase
//
//  Created by helmi taufiq alhakim on 14/06/21.
//

import UIKit

// MARK: - DATA SETUP FOR CAROUSEL
class CarouselModel {
    var image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
    
    static func FetchCarousel () -> [CarouselModel] {
        return [
            CarouselModel(image: UIImage(named: "promo-1")!),
            CarouselModel(image: UIImage(named: "promo-2")!),
            CarouselModel(image: UIImage(named: "promo-3")!),
        ]
    }
}
