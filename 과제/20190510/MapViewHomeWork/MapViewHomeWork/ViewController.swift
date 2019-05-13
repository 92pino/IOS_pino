//
//  ViewController.swift
//  MapViewHomeWork
//
//  Created by JinBae Jeong on 10/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
  var destinations = [CLLocationCoordinate2D]()
  var saveTxt: [CLLocationCoordinate2D] = []
  
  let backgroundView: UIView = {
    let v = UIView()
    v.backgroundColor = #colorLiteral(red: 0.9803583026, green: 0.9803673625, blue: 0.9845872521, alpha: 1)
    v.layer.borderWidth = 1
    v.layer.borderColor = #colorLiteral(red: 0.7714042866, green: 0.7741157294, blue: 0.7822500576, alpha: 1)
    v.translatesAutoresizingMaskIntoConstraints = false
    
    return v
  }()
  
  let addTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.backgroundColor = .white
    textField.font = textField.font?.withSize(25)
    textField.layer.borderWidth = 1
    textField.layer.cornerRadius = 5
    textField.layer.borderColor = #colorLiteral(red: 0.9145414233, green: 0.9096133709, blue: 0.9139304757, alpha: 1)
    
    return textField
  }()
  
  var mapView: MKMapView = {
    var m = MKMapView()
    m.translatesAutoresizingMaskIntoConstraints = false
    return m
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    autoLayout()
    configure()
  }
  
  private func configure() {
    addTextField.delegate = self
  }
  
  private func checkLocation() {
    let geocoder = CLGeocoder()
    
    geocoder.geocodeAddressString(addTextField.text ?? "", completionHandler: { (placeMark, error) in
      guard let placeMark = placeMark?.first else { return }
      self.destinations.append(placeMark.location!.coordinate)
      //            self.addAnnotation(placeMark.location?.coordinate) // 기본과제
      self.mapView.removeOverlays(self.mapView.overlays)
      self.mapView.removeAnnotations(self.mapView.annotations)
      self.addAnnotations(self.destinations)
      self.addTextField.text = ""
      
      var lati = placeMark.location!.coordinate.latitude
      var longi = placeMark.location!.coordinate.longitude
      
      self.saveTxt.append(placeMark.location!.coordinate)
      
      let mark = MKPointAnnotation()
      mark.title = "\(self.saveTxt.count)번째 행선지"
      mark.coordinate = CLLocationCoordinate2DMake(lati, longi)
      self.mapView.addAnnotation(mark)
      
      let center = CLLocationCoordinate2DMake(lati, longi)
      setRegion(coordinate: center)

    })
    
    func setRegion(coordinate: CLLocationCoordinate2D) {
      let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
      let region = MKCoordinateRegion(center: coordinate, span: span)
      mapView.setRegion(region, animated: true)
    }
  }
  
  func addAnnotations(_ center: [CLLocationCoordinate2D]) {
    guard !center.isEmpty else { return }
    
    mapView.delegate = self
    
    let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    let region = MKCoordinateRegion(center: center.last!, span: span)
    let destinationLine = MKPolyline(coordinates: self.destinations, count: self.destinations.count)
    
    for (idx, value) in destinations.enumerated() {
      let annotation: MKPointAnnotation = {
        let a = MKPointAnnotation()
        a.title = "\(idx+1)번째 행선지"
        a.coordinate = value
        return a
      }()
      
      var p1 = value; p1.latitude += 0.003; p1.longitude -= 0.003
      var p2 = value; p2.latitude += 0.003; p2.longitude += 0.003
      var p3 = value; p3.latitude -= 0.003; p3.longitude += 0.003
      var p4 = value; p4.latitude -= 0.003; p4.longitude -= 0.003
      
      let points: [CLLocationCoordinate2D] = [p1, p2, p3, p4, p1]
      let polyLine = MKPolyline(coordinates: points, count: points.count)
      
      mapView.addAnnotation(annotation)
      mapView.addOverlay(polyLine)
    }
    
    mapView.addOverlay(destinationLine)
    mapView.setRegion(region, animated: true)
  }
  // 기본 과제
  func addAnnotation(_ center: CLLocationCoordinate2D) {
    
    let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    let region = MKCoordinateRegion(center: center, span: span)
    var p1 = center; p1.latitude += 0.002; p1.longitude -= 0.002
    var p2 = center; p2.latitude += 0.002; p2.longitude += 0.002
    var p3 = center; p3.latitude -= 0.002; p3.longitude += 0.002
    var p4 = center; p4.latitude -= 0.002; p4.longitude -= 0.002
    
    let points: [CLLocationCoordinate2D] = [p1, p2, p3, p4, p1]
    let polyLine = MKPolyline(coordinates: points, count: points.count)
    let destinationLine = MKPolyline(coordinates: self.destinations, count: self.destinations.count)
    
    let annotation: MKPointAnnotation = {
      let a = MKPointAnnotation()
      a.title = "\(mapView.annotations.count+1)번째 행선지"
      a.subtitle = "\(mapView.annotations.count+1)"
      a.coordinate = center
      return a
    }()
    mapView.delegate = self
    mapView.addOverlay(polyLine)
    mapView.addOverlay(destinationLine)
    mapView.addAnnotation(annotation)
    mapView.setRegion(region, animated: true)
  }
  
  
  func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
    let textColor = UIColor.red
    let textFont = UIFont(name: "Helvetica Bold", size: 12)!
    
    let scale = UIScreen.main.scale
    UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
    
    let textFontAttributes = [
      NSAttributedString.Key.font: textFont,
      NSAttributedString.Key.foregroundColor: textColor,
      ] as [NSAttributedString.Key : Any]
    image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
    
    let rect = CGRect(origin: point, size: image.size)
    text.draw(in: rect, withAttributes: textFontAttributes)
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
  }
  
  private func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    
    view.backgroundColor = .white
    
    view.addSubview(backgroundView)
    view.addSubview(mapView)
    backgroundView.addSubview(addTextField)
    
    addTextField.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 7).isActive = true
    addTextField.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15).isActive = true
    addTextField.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -15).isActive = true
    addTextField.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -7).isActive = true
    
    backgroundView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    backgroundView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    backgroundView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    backgroundView.bottomAnchor.constraint(equalTo: mapView.topAnchor).isActive = true
    
    mapView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    mapView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor).isActive = true
    mapView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    mapView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    checkLocation()
    addTextField.resignFirstResponder()
    return true
  }
}

extension ViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    if let polyLine = overlay as? MKPolyline {
      let renderer = MKPolylineRenderer(polyline: polyLine)
      renderer.strokeColor = .red
      renderer.lineWidth = 1
      return renderer
    }
    return MKOverlayRenderer(overlay: overlay)
  }
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    var annotationView: MKAnnotationView
    
    if let reusableView = mapView.dequeueReusableAnnotationView(withIdentifier: "Annotation") {
      reusableView.annotation = annotation
      annotationView = reusableView
    } else {
      annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Annotation")
      annotationView.canShowCallout = true
      
      let addButton: UIButton = {
        let addButton = UIButton(type: .custom)
        addButton.tag = 0
        addButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        addButton.setTitle("X", for: .normal)
        addButton.setTitleColor(.red, for: .normal)
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = UIColor.red.cgColor
        addButton.layer.cornerRadius = 10
        addButton.titleLabel?.font = addButton.titleLabel?.font.withSize(16)
        addButton.addTarget(self, action: #selector(deleteAnnotation), for: .touchUpInside)
        return addButton
      }()
      annotationView.rightCalloutAccessoryView = addButton
    }
    return annotationView
  }
  
  @objc func deleteAnnotation() {
    let idx = Int(mapView.selectedAnnotations[0].title!!.dropLast("번째 행선지".count))
    
    mapView.removeOverlays(mapView.overlays)
    mapView.removeAnnotations(mapView.annotations)
    mapView.removeAnnotations(mapView.selectedAnnotations)
    destinations.remove(at: idx! - 1)
    addAnnotations(destinations)
  }
}
