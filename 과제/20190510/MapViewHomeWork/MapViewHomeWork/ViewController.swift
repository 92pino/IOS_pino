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
  var saveTxt: [CLLocationCoordinate2D] = []
  let notiCenter = NotificationCenter.default
  let temp: CLLocationCoordinate2D! = nil
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
    mapView.delegate = self
    
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
      
      self.saveTxt.append(placeMark.location!.coordinate)
      
      let mark = MKPointAnnotation()
      mark.title = "\(self.saveTxt.count)번째 행선지"
      mark.coordinate = CLLocationCoordinate2DMake(lati, longi)
      self.mapView.addAnnotation(mark)
      
      let center = CLLocationCoordinate2DMake(lati, longi)
      self.setRegion(coordinate: center)
      
      print(self.saveTxt)
      
      /*
        if self.saveTxt.count > 1 {
          self.addLine(self.temp, placeMark.location!.coordinate)
        }
      */
      
      var point1 = center; point1.longitude += 0.0015;   point1.latitude -= 0.0015
      var point2 = center; point2.longitude += 0.0015;   point2.latitude += 0.0015
      var point3 = center; point3.longitude -= 0.0015;   point3.latitude += 0.0015
      var point4 = center; point4.longitude -= 0.0015;   point4.latitude -= 0.0015
      let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4, point1]
    
      let rectangle = MKPolyline(coordinates: points, count: points.count)
      
      let line = MKPolyline(coordinates: self.saveTxt, count: self.saveTxt.count)
      self.mapView.addOverlay(line)
      self.mapView.addOverlay(rectangle)
    })
    
  }
  
  func setRegion(coordinate: CLLocationCoordinate2D) {
    let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    mapView.setRegion(region, animated: true)
  }
  
}

extension ViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    if let polyline = overlay as? MKPolyline {
      let renderer = MKPolylineRenderer(polyline: polyline)
      renderer.strokeColor = .red
      renderer.lineWidth = 2
      return renderer
    }
    return MKOverlayRenderer(overlay: overlay)
  }
}
