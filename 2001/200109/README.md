# 200109 Core Location / MapKit

![200109location](https://tva1.sinaimg.cn/large/006tNbRwgy1gaqmdpl451j31lh0u07k2.jpg)



## 1. MyLocationViewController

- 해당위치로 바로 이동

```swift
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
		// mapView.mapType = .satellite
  }
  
  // 사용자에게 이앱에서 사용자의 위치권한을 설정해줬는지 뜨는창
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
    
		// locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    // 위치정확도
		// locationManager.distanceFilter = 10.0
    // 10미터이동시마다 갱신할것이다
    
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

```



##  2. GeocodeViewController

* 탭한 위치의 주소, 경도 프린트

```swift
import MapKit
import UIKit

final class GeocodeViewController: UIViewController {

  @IBOutlet private weak var mapView: MKMapView!
  
  @IBAction func recognizeTap(gesture: UITapGestureRecognizer) {
    let touchPoint = gesture.location(in: gesture.view)
    let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
    let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
    reverseGeocede(location: location)
  }
  
  func reverseGeocede(location: CLLocation) {
    let geocoder = CLGeocoder()
    
     geocoder.reverseGeocodeLocation(location) { placeMark, error in
      print("\n---------- [ 위경도 -> 주소 ] ----------")
      if error != nil {
       return print(error!.localizedDescription)
      }
       
      // 국가별 주소체계에 따라 어떤 속성 값을 가질지 다름
      guard let address = placeMark?.first,
       let country = address.country,
       let administrativeArea = address.administrativeArea,
       let locality = address.locality,
       let name = address.name
       else { return }
       
      let addr = "\(country) \(administrativeArea) \(locality) \(name)"
      print(addr)
      
      self.geocodeAddressString(addr)
     }
    }

  func geocodeAddressString(_ addressString: String) {
    print("\n---------- [ 주소 -> 위경도 ] ----------")
    let geocoder = CLGeocoder()
     geocoder.geocodeAddressString(addressString) { (placeMark, error) in
      if error != nil {
       return print(error!.localizedDescription)
      }
      guard let place = placeMark?.first else { return }
      print(place)
       
      // 위경도값 가져오기
      print(place.location?.coordinate)
    }
  }
}
```



## 3. BasicAnnotationViewController

* 핀추가, 해당핀으로 랜덤이동, 핀제거, 카메라설정

```swift
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
		// mapView.mapType = .hybrid
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
```



##  4. RendererOverlayViewController

* Circle, Star 모양그리기, 제거
* 우리집핀추가, 제거

```swift
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
```

