//
//  ImageCacheManager.swift
//  TuturuTestTask
//
//  Created by Дмитрий Дуров on 01.10.2022.
//

import UIKit

class ImageCacheManager {
    
    static let shared = NSCache<NSString, UIImage>()
    
    private init() {}
}
