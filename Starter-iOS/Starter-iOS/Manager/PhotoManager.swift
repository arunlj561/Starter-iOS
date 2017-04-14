//
//  PhotManager.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 4/13/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import Photos

struct PhotoManager {
    static var pickerCont :ImageController?
    
    static func runIfAuthorized(_ controller:UIViewController,  block: @escaping (_ info : [String : Any] ) -> Void) {
        pickerCont = ImageController(controller)
        requestAuthorization { status in
            if status == .authorized {
                pickerCont?.pickerControllerWithMedia = { info in
                      block(info)
                }
                
            }else{
                requestAuthorization({ (status :PHAuthorizationStatus) in
                    if status == PHAuthorizationStatus.authorized{
                        self.pickerCont?.pickerControllerWithMedia = { info in
                            block(info)
                        }
                    }
                })
            }
        }
    }
    
    static func requestAuthorization(_ completion: @escaping (PHAuthorizationStatus) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch (status) {
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization(completion)
            
        case .restricted, .authorized:
            completion(status)
            
        case .denied:
            showAlertForDenied()
            completion(status)
        }
    }
    
    fileprivate static func showAlertForDenied() {
        Utils.showAlert(title: "Alert", message: "You have not given access to Photos. To enable tap on settings", buttonTitle: "Change Setting", cancelButton: "Cancel", controller: (Utils.topView.topController?.rootViewController)!, shouldDismiss: true) {
            self.goToSetting()
        }
    }
    
    fileprivate static func goToSetting() {
        if let url = URL(string: UIApplicationOpenSettingsURLString) {
            UIApplication.shared.openURL(url)
        }
    }
    
    func openCamera(_ option:String, isAllowEditing : Bool = false, sourceType:UIImagePickerControllerSourceType, controller:UIViewController){
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let pickerController = UIImagePickerController()
            pickerController.sourceType = sourceType
            pickerController.delegate = PhotoManager.pickerCont
            pickerController.allowsEditing = isAllowEditing
            if option.letterize().count > 0 {
                pickerController.mediaTypes.append(option)
            }
            
            controller.present(pickerController, animated: true, completion: {
                
            })
            
            
        }
    }
}

class ImageController: NSObject,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var controller :  UIViewController?
    init(_ controller:UIViewController) {
        super.init()
        self.controller = controller
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
    var pickerControllerWithMedia:(([String : Any])->())!
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        picker.dismiss(animated: true) {
            self.pickerControllerWithMedia(info)
        }
    }
    
    
    
        
        
        
}
