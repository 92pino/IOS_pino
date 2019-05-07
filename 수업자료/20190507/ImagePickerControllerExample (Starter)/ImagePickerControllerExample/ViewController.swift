//
//  ViewController.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2019. 5. 3..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import MobileCoreServices
import UIKit

final class ViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView!
  private let imagePickerController = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imagePickerController.delegate = self
  }
  
  @IBAction private func pickImage(_ sender: Any) {
    print("\n---------- [ pickImage ] ----------\n")
    present(imagePickerController, animated: true)
    
    // 앨범 타입
    imagePickerController.sourceType = .photoLibrary
//    imagePickerController.sourceType = .savedPhotosAlbum
  }
  
  
  @IBAction private func takePicture(_ sender: Any) {
    print("\n---------- [ takePicture ] ----------\n")
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    imagePickerController.sourceType = .camera

    imagePickerController.mediaTypes = [kUTTypeImage as String]
//    imagePickerController.mediaTypes = ["public.image"]
    
//    let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)
//    imagePickerController.mediaTypes = mediaTypes ?? []
    
    present(imagePickerController, animated: true)
  }
  
  @IBAction private func takePictureWithDelay(_ sender: Any) {
    print("\n---------- [ takePictureWithDelay ] ----------\n")
    
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    imagePickerController.sourceType = .camera
    imagePickerController.mediaTypes = [kUTTypeImage as String]
    present(imagePickerController, animated: true) {
//      self.imagePickerController.takePicture()
      
      // 타이머를 주고싶다면 + 2 를 변경 (파라미터값으로 받아오기)
      DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
        self.imagePickerController.takePicture()
      })
    }
  }
  
  
  @IBAction private func recordingVideo(_ sender: Any) {
    print("\n---------- [ recordingVideo ] ----------\n")
    
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    imagePickerController.sourceType = .camera
    // kUTTypeMovie : 오디오가 포함된 동영상
    // kUTTypeVideo : 오디오가 포함되지 않은 동영상
    imagePickerController.mediaTypes = [kUTTypeMovie as String]
    // imagePickerController.mediaTypes = ["public.movie"]
    
    // 앞쪽 카메라
    // imagePickerController.cameraDevice = .front
    
    // 뒤쪽 카메라
    // imagePickerController.cameraDevice = .rear
    
    // 카메라, 비디오 두가지 다 사용 가능하게 하기
    let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)
    imagePickerController.mediaTypes = mediaTypes ?? []
    
    // 어떤거를 먼저 시작 화면으로 만들지
    // imagePickerController.cameraCaptureMode = .video
    imagePickerController.cameraCaptureMode = .photo
    
    present(imagePickerController, animated: true)
    
    // imagePickerController.startVideoCapture()
    // imagePickerController.stopVideoCapture()
  }

  @IBAction private func toggleAllowsEditing(_ sender: Any) {
    print("\n---------- [ toggleAllowsEditing ] ----------\n")
    imagePickerController.allowsEditing.toggle()
  }
}

// MARK - UIImagePickerControllerDelegate

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  //
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    print("\n---------- [ didFinishPickingMediaWithInfo ] ----------\n")
    
    let mediaType = info[.mediaType] as! NSString
    if UTTypeEqual(mediaType, kUTTypeImage) {
      let originalImage = info[.originalImage] as! UIImage
      let editedImage = info[.editedImage] as? UIImage
      let selectedImage = editedImage ?? originalImage
      
      if picker.sourceType == .camera {
      // 사진 저장
        UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
      }
      
      imageView.image = selectedImage
    } else if UTTypeEqual(mediaType, kUTTypeMovie) {
      print("Video info :", info)
      if let mediaPath = (info[.mediaURL] as? NSURL)?.path,
        UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaPath) {
        UISaveVideoAtPathToSavedPhotosAlbum(mediaPath, nil, nil, nil)
      }
    }
    
    picker.dismiss(animated: true)
  }
  
  
}
