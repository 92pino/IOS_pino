//
//  RendererOverlayViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2019. 5. 5..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit
import MapKit

final class RendererOverlayViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  
  @IBAction func addCircle(_ sender: Any) {
    let center = mapView.centerCoordinate
    let circle = MKCircle(center: center, radius: 100)
    mapView.addOverlay(circle)
  }
  
  @IBAction func addStar(_ sender: Any) {
    let center = CLLocationCoordinate2DMake(37.5100743, 126.9466673)
    
    var point1 = center; point1.latitude += 0.35
    var point2 = center; point2.longitude += 0.4;   point2.latitude -= 0.15
    var point5 = center; point5.longitude -= 0.4;   point5.latitude -= 0.15
    
    let points: [CLLocationCoordinate2D] = [point1, point2, point5, point1,]
    let polyline = MKPolyline(coordinates: points, count: points.count)
    
    mapView.addOverlay(polyline)
  }
  
  @IBAction private func removeOverlays(_ sender: Any) {
    mapView.removeOverlays(mapView.overlays)
  }
}

extension RendererOverlayViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    if let circle = overlay as? MKCircle {
      let renderer = MKCircleRenderer(circle: circle)
      renderer.strokeColor = .blue
      renderer.lineWidth = 2
      return renderer
    }
    if let polyline = overlay as? MKPolyline {
      let renderer = MKPolylineRenderer(polyline: polyline)
      renderer.strokeColor = .red
      renderer.lineWidth = 2
      return renderer
    }
    return MKOverlayRenderer(overlay: overlay)
  }
}
