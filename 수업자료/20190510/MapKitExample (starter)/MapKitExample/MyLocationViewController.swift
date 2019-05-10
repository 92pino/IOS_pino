//
//  MyLocationViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2019. 5. 5..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import MapKit
import UIKit

final class Annotation: NSObject, MKAnnotation {
  var title: String?
  var coordinate: CLLocationCoordinate2D
  
  init(title: String, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.coordinate = coordinate
  }
}

final class MyLocationViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  private let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    locationManager.delegate = self
    checkAuthorizationStatus()
    
    mapView.showsUserLocation = true
    mapView.mapType = .satellite
    
//    mapView.showsCompass = true
  }
  
  // coreLocation을 시작할 때 권한 요청
  func checkAuthorizationStatus(){
    switch CLLocationManager.authorizationStatus() {
      // 사용자가 아직 허용할지 안할지 결정 안한 상태
      // ex) 메시지를 봤어도 홈키를 누르거나 앱을 종요했을 경우
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
       // locationManager.requestAlwaysAuthorization()
    case .restricted, .denied:
      // Disabled location features
      break
    case .authorizedWhenInUse:
      fallthrough
    case .authorizedAlways:
      startUpdatingLocation()
    @unknown default:
      break
    }
  }
  
  func startUpdatingLocation() {
    let status = CLLocationManager.authorizationStatus()
    print(status)
    guard status == .authorizedAlways || status == .authorizedWhenInUse, CLLocationManager.locationServicesEnabled() else { return }
    
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    locationManager.distanceFilter = 10.0
    locationManager.startUpdatingLocation()
  }
  
  @IBAction private func mornitoringHeading(_ sender: Any) {
    guard CLLocationManager.headingAvailable() else { return }
    locationManager.startUpdatingHeading()
  }
  
  @IBAction private func stopMornitoring(_ sender: Any) {
    locationManager.stopUpdatingHeading()
  }
}

// MARK - CLLocationManagerDelegate
extension MyLocationViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    print("\n---------- [ status ] ----------\n")
    switch status {
    case .authorizedAlways, .authorizedWhenInUse:
      print("Authorized")
    default:
      print("Unauthorized")
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let current = locations.last!

    
    if (abs(current.timestamp.timeIntervalSinceNow) < 10) {
    
      let coordinate = current.coordinate
      
      // span의 단위 1도
      // 경도 1도는 약 111 킬로미터, 위도 1도는 위도에 따라 변함 : 적도 (약 111km) ~ 극지방 (0km)
      let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
      let region = MKCoordinateRegion(center: coordinate, span: span)
      mapView.setRegion(region, animated: true)
      
      addAnnotation(location: current)
    }
  }
  
  func addAnnotation(location: CLLocation) {
    let annotation = Annotation(title: "MyLocation", coordinate: location.coordinate)
    mapView.addAnnotation(annotation)
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    if let error = error as? CLError, error.code == .denied {
      // Location updates are no authorized.
      return
    }
    // Notify the user of any errors.
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    print("trueHeading :", newHeading.trueHeading)
    print("magneticHeading :", newHeading.magneticHeading)
    print("values \(newHeading.x), \(newHeading.y), \(newHeading.z)")
  }
}
