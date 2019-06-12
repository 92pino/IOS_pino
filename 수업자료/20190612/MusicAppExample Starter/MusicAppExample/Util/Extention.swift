//
//  Extention.swift
//  URLSessionPractice
//
//  Created by Wi on 10/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left{
            self.leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom{
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right{
            self.trailingAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        
    }
}

var imageCache = [String: UIImage]()

extension UIImageView {
    
    func loadImage(with urlString: String) {
        // self == UIImageView
        // nil을 넣는 이유 : 이미지가 있을 경우도 있으므로 이미지를 비워주기 위한 용도
        self.image = nil
        
        // make URL
        guard let url = URL(string: urlString) else { return }
        
        // image 있는지 검사
        if let chachedImage = imageCache[urlString] {
            self.image = chachedImage
            return
        }
        
        // 데이터 요청하기
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // error
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let imageData = data else { return }
            
            // 이미지 넣기
            let photoImage = UIImage(data: imageData)
            
            // 이미지 url : UIImage 형태로 저장해놓기
            imageCache[url.absoluteString] = photoImage
            
            DispatchQueue.main.async {
                self.image = photoImage
            }
        }.resume()
        
    }
}

extension UIView {
    func zoomIn(duration duration: TimeInterval = 0.2) {
        self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) { (animationCompleted: Bool) -> Void in
        }
    }
}
