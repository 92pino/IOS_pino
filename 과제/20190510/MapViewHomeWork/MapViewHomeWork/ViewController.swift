//
//  ViewController.swift
//  MapViewHomeWork
//
//  Created by JinBae Jeong on 10/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import MapKit

final class Annotation: NSObject, MKAnnotation {
  var title: String?
  var coordinate: CLLocationCoordinate2D
  
  init(title: String, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.coordinate = coordinate
  }
}

class ViewController: UIViewController {
  
  let searchView = UIView()
  let searchTextField = UITextField()
  let mapView = MKMapView()
  var saveTxt: [Double:Double] = [:]
  let notiCenter = NotificationCenter.default
  private let locationManager = CLLocationManager()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    configure()
    checkAuthorizationStatus()
  }
  
  func configure() {
    view.addSubview(searchView)
    searchView.addSubview(searchTextField)
    searchView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    searchTextField.placeholder = "주소를 입력하세요"
    searchTextField.backgroundColor = .white
    view.addSubview(mapView)
    searchTextField.delegate = self
    
    guard CLLocationManager.headingAvailable() else { return }
    locationManager.startUpdatingHeading()
    checkAuthorizationStatus()
    
    autoLayout()
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
    @unknown default:
      break
    }
  }
  
  func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    searchView.translatesAutoresizingMaskIntoConstraints = false
    searchView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    searchView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    searchView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    searchView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    
    searchTextField.translatesAutoresizingMaskIntoConstraints = false
    searchTextField.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 10).isActive = true
    searchTextField.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 10).isActive = true
    searchTextField.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -10).isActive = true
    searchTextField.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -10).isActive = true
    
    mapView.translatesAutoresizingMaskIntoConstraints = false
    mapView.topAnchor.constraint(equalTo: searchView.bottomAnchor).isActive = true
    mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }

}

extension ViewController: UITextFieldDelegate {
  
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    searchTextField.resignFirstResponder()
    
    goToLocation()
    
    searchTextField.text = ""
    return true
  }
  
  func goToLocation(){
    let geocoder = CLGeocoder()
    
    var location = searchTextField.text!
    
    geocoder.geocodeAddressString(location, completionHandler: { (placeMark, error) in
      guard let placeMark = placeMark?.first else { return }
      var lati = placeMark.location!.coordinate.latitude
      var longi = placeMark.location!.coordinate.longitude
      
      self.saveTxt.updateValue(lati, forKey: longi)
      
      let mark = MKPointAnnotation()
      mark.title = "\(self.saveTxt.count)번째 행선지"
      mark.coordinate = CLLocationCoordinate2DMake(lati, longi)
      self.mapView.addAnnotation(mark)
      
      let center = CLLocationCoordinate2DMake(lati, longi)
      self.setRegion(coordinate: center)
    })
    
  }
  
  func setRegion(coordinate: CLLocationCoordinate2D) {
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    mapView.setRegion(region, animated: true)
  }
  
}
