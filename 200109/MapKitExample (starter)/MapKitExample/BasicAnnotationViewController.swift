//
//  BasicAnnotationViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2020. 1. 5..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit

final class BasicAnnotationViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    let center = CLLocationCoordinate2DMake(37.566308, 126.977948)
    setRegion(coordinate: center)
  }
  
  func setRegion(coordinate: CLLocationCoordinate2D) {
    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    mapView.setRegion(region, animated: true)
  }
  
  // 핀추가
  @IBAction private func addAnnotation(_ sender: Any) {
    let cityHall = MKPointAnnotation()
    cityHall.title = "시청"
    cityHall.subtitle = "서울특별시"
    cityHall.coordinate = CLLocationCoordinate2DMake(37.566308, 126.977948)
    mapView.addAnnotation(cityHall)
    
    let namsan = MKPointAnnotation()
    namsan.title = "남산"
    namsan.coordinate = CLLocationCoordinate2DMake(37.551416, 126.988194)
    mapView.addAnnotation(namsan)
    
    let gimpoAirport = MKPointAnnotation()
    gimpoAirport.title = "김포공항"
    gimpoAirport.coordinate = CLLocationCoordinate2DMake(37.559670, 126.794320)
    mapView.addAnnotation(gimpoAirport)
    
    let gangnam = MKPointAnnotation()
    gangnam.title = "강남역"
    gangnam.coordinate = CLLocationCoordinate2DMake(37.498149, 127.027623)
    mapView.addAnnotation(gangnam)
  }
  
  //랜덤핀으로 이동
  @IBAction private func moveToRandomPin(_ sender: Any) {
    guard !mapView.annotations.isEmpty else { return }
    let random = Int.random(in: 0..<mapView.annotations.count)
    let annotation = mapView.annotations[random]
    setRegion(coordinate: annotation.coordinate)
  }
  
  @IBAction private func removeAnnotation(_ sender: Any) {
    mapView.removeAnnotations(mapView.annotations)
  }
  
  var heading = 0.0
  @IBAction private func setupCamera(_ sender: Any) {
    
    // 위성으로 보여지게
//     mapView.mapType = .hybrid
    
    let camera = MKMapCamera()
    camera.centerCoordinate = CLLocationCoordinate2DMake(37.551416, 126.988194)
    // 고도 (미터 단위)
    camera.altitude = 200
    // 카메라 각도(0일 때 수직으로 내려다보는 형태)
    camera.pitch = 70.0
    // z카메라보는 각도
    heading += 20.0
    camera.heading = heading
    mapView.setCamera(camera, animated: true)
    
  }
}
