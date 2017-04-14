//
//  ImageViewAdditions.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 4/13/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import UIKit
//import AlamofireImage
import Kingfisher

public extension UIImageView {
    
    func blurImage() {
        let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = self.bounds
        blurView.tag = 1
        self.addSubview(blurView)
    }
    
    func removeBlurImage(){
        self.viewWithTag(1)?.removeFromSuperview()
    }
    
    func showActivityIndicator(){
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.tag = 2
        activityIndicator.center = self.center
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
    }
    
    func hideActivityIndicator(){
        self.viewWithTag(2)?.removeFromSuperview()
    }
    
   
    
    func downloadImageFromServer(url :URL) {
        kf.indicatorType = .activity
        ImageDownloader.default.downloadImage(with: url, options: [.transition(.fade(0.2))], progressBlock: { (received, total) in
            self.kf.indicator?.startAnimatingView()
        }) { (loadedImage:Image?, error:Error?, url :URL?, imageData:Data?) in
            self.kf.indicator?.stopAnimatingView()
                self.image = loadedImage
        }
    }
}



//class ImageManager: ImageDownloader {
//    static let sharedInstance: ImageManager = ImageManager(
//        configuration: ImageDownloader.defaultURLSessionConfiguration(),downloadPrioritization: .fifo, maximumActiveDownloads: 20, imageCache: AutoPurgingImageCache(memoryCapacity: 100_000_000, preferredMemoryUsageAfterPurge: 60_000_000))
//    
//    func downloadImageForPath(_ imageUrl:String, filePath: String, completion:@escaping (_ localPath:String)->(), withFailure failure:@escaping()->() ){
//        
//        let urlRequest = URLRequest(url: URL(string: imageUrl)!)
//        
//        ImageManager.sharedInstance.download(
//        urlRequest) { (response) in
//            guard (try? response.data?.write(to:URL(fileURLWithPath: Utils.filePath(file: filePath).path))) != nil else {
//                print("Error While Saving Image")
//                completion("Error While Saving Image")
//                failure()
//                return
//            }
//            completion(filePath)
//        }
//        
//    }
//    
//}
