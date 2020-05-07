//
//  MyLocationViewController.swift
//  MapKitExample
//
//  Created by giftbot on 2020. 1. 5..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit

final class MyLocationViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  let locationManager = CLLocationManager()
  private var setup = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.delegate = self
    checkAuthorizationStatus()
    
    // 나의위치를 맵뷰에 true
    mapView.showsUserLocation = true
    
    // 위성으로보기
//    mapView.mapType = .satellite
  }
  
  // 사용자에게 이앱에서 사용자의 위치권한을 설정해줬는지 뜨는창임
  func checkAuthorizationStatus() {
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    case .restricted, .denied: break
    case .authorizedWhenInUse:
      fallthrough
    case .authorizedAlways:
      startUpdatingLocation()
    @unknown default: break     // 모든 케이스를 다다뤘음에도 러닝이뜰경우 그냥 브레이크해주면됨
    }
  }
  
  func startUpdatingLocation() {
    let status = CLLocationManager.authorizationStatus()
    guard status == .authorizedWhenInUse || status == .authorizedAlways else { return }
    guard CLLocationManager.locationServicesEnabled() else { return }
    
    
//    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    /// 위치정확도
//    locationManager.distanceFilter = 10.0
    /// 10미터이동시마다 갱신할것이다
    
    //내가만든 함수를 자체실행 동작
    locationManager.startUpdatingLocation()
  }
  
  @IBAction func mornitoringHeading(_ sender: Any) {
    guard CLLocationManager.headingAvailable() else { return }
    locationManager.startUpdatingHeading()
  }
  
  @IBAction func stopMornitoring(_ sender: Any) {
    locationManager.stopUpdatingHeading()
  }
}

extension MyLocationViewController: CLLocationManagerDelegate {

  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    switch status {
    case .authorizedWhenInUse, .authorizedAlways:
      print("Authorized")
    default:
      print("Unauthorized")
    }
  }
  

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let current = locations.last!
    let coordinate = current.coordinate
    
    //앱을 종료하거나 끌때 저장되어있는 값들까지 location에 포함되는데 현재시간으로부터 10초이내일때만 아레것을 실행하도록
    //오래된정보면 무시해라 10초이내의 값만 사용하도록 처리
    //locations -> 많은 값들이 저장되어있음
    if (abs(current.timestamp.timeIntervalSinceNow) < 10) {
//    if !setup {
      // span 단위는 1도( 경도 1도는 약 111킬로미터)
      let span = MKCoordinateSpan(latitudeDelta: 0.0001, longitudeDelta: 0.0001)
      //  어떤위치를 보여줄것인가
      let region = MKCoordinateRegion(center: coordinate, span: span)
      mapView.setRegion(region, animated: true)
    }
    
    addAnnotation(location: current)
  }
  // 이동위치에 마크를 남기고싶음
  func addAnnotation(location: CLLocation) {
    let annotation = MKPointAnnotation()
    annotation.title = "MyLocation"
    annotation.coordinate = location.coordinate
    mapView.addAnnotation(annotation)
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    print("trueHeading: ", newHeading.trueHeading) // 진북
    print("magneticHeading: ", newHeading.magneticHeading)  // 자북
    print("values \(newHeading.x), \(newHeading.y), \(newHeading.z)")
  }
}
