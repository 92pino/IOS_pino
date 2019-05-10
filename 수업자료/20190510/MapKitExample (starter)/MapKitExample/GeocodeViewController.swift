//
//  GeocodeViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2019. 5. 5..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit
import MapKit


final class GeocodeViewController: UIViewController {

  @IBOutlet private weak var mapView: MKMapView!
  
  @IBAction func recognizeTap(gesture: UITapGestureRecognizer) {
    let touchPoint = gesture.location(in: gesture.view)
    let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
    let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
    let geocoder = CLGeocoder()
    
    geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
      if error != nil {
        return print(error!.localizedDescription)
      }
      
      guard let address = placeMark?.first,
        // 나라명
      let country = address.country,
        // 시
      let administrativeArea = address.administrativeArea,
        // 구 이름
      let locality = address.locality,
        // 나머지 주소
      let name = address.name
        else { return }
      print("\n---------- [ 터치 좌표 주소 ] ----------\n")
      print("- \(country) \(administrativeArea) \(locality) \(name)")
      
//      let addr = "\(country) \(administrativeArea) \(locality) \(name)"
//      geocoder.geocodeAddressString(addr, completionHandler: { (placeMark, error) in
//        print(placeMark)
//      })
      let homeName: String = "대한민국 서울특별시 동작구 만양로8길 50"
      geocoder.geocodeAddressString(homeName, completionHandler: { (placeMark, error) in
        guard let placeMark = placeMark?.first else { return }
        print(placeMark.location!.coordinate)
        print(placeMark.region!.identifier)
      })
      
    }
  }
}
