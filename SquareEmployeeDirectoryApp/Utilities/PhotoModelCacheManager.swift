//
//  PhotoModelCacheManager.swift
//  SquareEmployeeDirectoryApp
//
//  Created by Andrea Monroy on 1/14/23.
//

import Foundation
import SwiftUI

class PhotoModelCacheManager {
    
    //singleton
    static let instance = PhotoModelCacheManager()
    
    private init(){}
    
    var photoCache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 200
        cache.totalCostLimit = 1024 * 1024 * 200 // 200mb
        return cache
    }()
    
    // MARK: - add to cache
    // method that adds an image to the cache with the specified key
    func add(key: String, value:UIImage){
        photoCache.setObject(value, forKey: key as NSString)
    }
    // MARK: - get from cache
    // method that returns the image associated with the specified key, if it exists
    func get(key: String) -> UIImage?{
        photoCache.object(forKey: key as NSString)
    }
}

