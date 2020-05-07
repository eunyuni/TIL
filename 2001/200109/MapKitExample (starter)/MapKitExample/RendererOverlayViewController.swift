//
//  RendererOverlayViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2020. 1. 5..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit

final class RendererOverlayViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  
  @IBAction func addCircle(_ sender: Any) {
    let center = mapView.centerCoordinate
    let circle = MKCircle(center: center, radius: 40000)
    mapView.addOverlay(circle)
  }
  
  @IBAction func addStar(_ sender: Any) {
    let center = mapView.centerCoordinate
    
    var point1 = center; point1.latitude += 0.65
    var point2 = center; point2.longitude += 0.4;   point2.latitude -= 0.15
    var point3 = center; point3.longitude -= 0.45;  point3.latitude += 0.4
    var point4 = center; point4.longitude += 0.45;  point4.latitude += 0.4
    var point5 = center; point5.longitude -= 0.4;   point5.latitude -= 0.15
    
    let points: [CLLocationCoordinate2D] = [point1, point2, point3, point4, point5, point1]
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
      renderer.strokeColor = UIColor.cyan
      renderer.lineWidth = 2
      return renderer
    }
    if let polyline = overlay as? MKPolyline {
      let renderer = MKPolylineRenderer(polyline: polyline)
      renderer.strokeColor = .systemPink
      renderer.lineWidth = 2
      return renderer
    }
    return MKOverlayRenderer(overlay: overlay)
  }
  
  /**************************
   [ 실습 ]
   자신의 집 주소에 Annotation 추가해보기
   자신의 집 주소 주변에 삼각형으로 표시하기
   **************************/
  
  @IBAction private func addAnnotation(_ sender: Any) {
    let myHouse = MKPointAnnotation()
    myHouse.title = "❤️우리집💛"
    myHouse.subtitle = "서울특별시"
    myHouse.coordinate = CLLocationCoordinate2DMake(37.54277310, 126.84507750)
      // 37.36277940, 127.93107300)
    mapView.addAnnotation(myHouse)
    
    let center = myHouse.coordinate
    var point1 = center; point1.latitude += 0.25
    var point3 = center; point3.longitude += 0.3; point3.latitude -= 0.15
    var point5 = center; point5.longitude -= 0.3; point5.latitude -= 0.15
    
    let points: [CLLocationCoordinate2D] = [point1, point3, point5, point1]
    let polyline = MKPolyline(coordinates: points, count: points.count)
    mapView.addOverlay(polyline)
  }
  
  @IBAction private func removeAnnotation(_ sender: Any) {
    mapView.removeAnnotations(mapView.annotations)
  }
  
}
