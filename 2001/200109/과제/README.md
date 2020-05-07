## 200109 과제

## [ 과제 - Annotation]
1. 입력한 주소들을 차례대로 잇는 선 만들기   (샘플 영상 참고)
> 텍스트필드에 주소를 입력하면 해당 위치로 애니메이션과 함께 맵 이동 (CoordinateSpan 값 - 0.02)
> 입력한 주소값으로 이동한 뒤 그 위치를 표시하기 위한 사각형 그리기 + Annotation 추가하기
> Annotation 의 제목은 1번째 행선지, 2번째 행선지 처럼 순서를 표시하고, 부제목은 그 곳의 주소 나타내기
> 마지막으로 입력한 주소값과 그 직전의 주소값 사이에 선 그리기
  (가장 처음 입력한 주소는 그것과 연결할 직전의 주소값이 없으므로 제외)
참고: delegate 메서드 중 regionDidChangeAnimated 메서드 참고

![200109Homework](https://tva1.sinaimg.cn/large/006tNbRwgy1garm2k01y2j316r0u0akc.jpg)

```swift
import MapKit
import UIKit

/*****************************
 [ 과제 ]
 1. 입력한 주소들을 차례대로 잇는 선 만들기   (샘플 영상 참고)
 > 텍스트필드에 주소를 입력하면 해당 위치로 애니메이션과 함께 맵 이동 (CoordinateSpan 값 - 0.02)
 > 입력한 주소값으로 이동한 뒤 그 위치를 표시하기 위한 사각형 그리기 + Annotation 추가하기
 > Annotation 의 제목은 1번째 행선지, 2번째 행선지 처럼 순서를 표시하고, 부제목은 그 곳의 주소 나타내기
 > 마지막으로 입력한 주소값과 그 직전의 주소값 사이에 선 그리기
 (가장 처음 입력한 주소는 그것과 연결할 직전의 주소값이 없으므로 제외)
 참고: delegate 메서드 중 regionDidChangeAnimated 메서드 참고
 *****************************/

class AnnotationHomeworkViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  
  var search: String?
  var address: String = ""
  var line: CLLocationCoordinate2D?
  
  // 뷰가보여질때 UISearchController설정, searchBar.delegate설정, navigationitem설정
  override func viewDidLoad() {
    super.viewDidLoad()
    let search = UISearchController(searchResultsController: nil)
    search.searchBar.delegate = self
    navigationItem.searchController = search
  }
  
  // setRegion -> 위치이동애니메이션, 행선지어노테이션, 폴리스라인글려주고, 이동선함수 실행
  func setRegion(coordinate: CLLocationCoordinate2D) {
    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    mapView.setRegion(region, animated: true)
    
    let myTravel = MKPointAnnotation()
    myTravel.title = "\(self.address)💙"
    myTravel.subtitle = "행선지임니다"
    myTravel.coordinate = coordinate
    // 37.36277940, 127.93107300)
    mapView.addAnnotation(myTravel)
    
    let center = myTravel.coordinate
    var point1 = center; point1.latitude += 0.15; point1.longitude -= 0.15
    var point2 = center; point2.latitude += 0.15; point2.longitude += 0.15
    var point3 = center; point3.latitude -= 0.15; point3.longitude -= 0.15
    var point4 = center; point4.latitude -= 0.15; point4.longitude += 0.15
    
    let points: [CLLocationCoordinate2D] = [point1, point2, point4, point3, point1]
    let polyline = MKPolyline(coordinates: points, count: points.count)
    mapView.addOverlay(polyline)
    
    // 현재값을 반영
    addAnnotation(center1: center)
    
    // 전의값을저장
    self.line = center
  }
  
  // addAnnotation -> 현재의 행선지와 전의행선지 사이의 라인을 그려줌
  func addAnnotation(center1: CLLocationCoordinate2D) {
    guard let center = line else { return }
    
    let points: [CLLocationCoordinate2D] = [center1, center]
    let polyline = MKPolyline(coordinates: points, count: points.count)
    mapView.addOverlay(polyline)
  }

  // geocodeAddressString -> 주소를 위경도로 바꿔서 값을 setRegion함수에 전달, address에 장소이름 저장
  func geocodeAddressString(_ addressString: String) {
    print("\n---------- [ 주소 -> 위경도 ] ----------")
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(addressString) { (placeMark, error) in
      if error != nil {
        return print(error!.localizedDescription)
      }
      guard let place = placeMark?.first else { return }
      guard let coordinate = place.location?.coordinate else { return }
      self.address = place.name!
      
      self.setRegion(coordinate: coordinate)
       //위경도값 가져오기
      print(place.location?.coordinate)
    }
  }
}

extension AnnotationHomeworkViewController: MKMapViewDelegate {
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
}

// UISearchBarDelegate확장 -> searchBar의 검색완료시 주소를위경도로 바꿔주는 함수에 전달
extension AnnotationHomeworkViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let search1 = searchBar.text else { return }
    geocodeAddressString(search1) 
  }
}
```
