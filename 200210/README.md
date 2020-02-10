## UIDevice

![UIDevice](https://tva1.sinaimg.cn/large/0082zybpgy1gbrcd0obm7j311y0u0qee.jpg)

```swift
import UIKit

/***************************************************
 UIDevice
 - 디바이스 이름 / 모델 / 화면 방향 등
 - OS 이름 / 버전
 - 인터페이스 형식 (phone, pad, tv 등)
 - 배터리 정보
 - 근접 센서 정보
 - 멀티태스킹 지원 여부
 ***************************************************/

final class ViewController: UIViewController {
  
  @IBOutlet private weak var label: UILabel!
  let device = UIDevice.current
  let notiCenter = NotificationCenter.default
  
  @IBAction private func systemVersion() {
    print("\n---------- [ System Version ] ----------\n")
    
    print("System name:", device.systemName)
    
    let systemVersion = device.systemVersion
    print(systemVersion)
    label.text = systemVersion
    
    let spliVersion = systemVersion.split(separator: ".").compactMap { Int($0) }
    print(spliVersion)
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillShowNotification(_:)),
      name: UIResponder.keyboardWillShowNotification, 
      object: nil
    )
    NotificationCenter.default.addObserver(
      self, 
      selector: #selector(keyboardWillShowNotification(_:)), 
      name: UIResponder.keyboardWillHideNotification, 
      object: nil
    )
  }
  
  @objc func keyboardWillShowNotification(_ noti: Notification) {
    guard let userInfo = noti.userInfo,
      let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
      
      // 키보드올라갈때 애니메이션 효과
      let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
      else { return }
    if frame.origin.y >= UIScreen.main.bounds.height {
    
    }
    UIView.animate(withDuration: duration) {
     // content
    }
  }
  
  @IBAction private func architecture() {
    print("\n---------- [ Architecture ] ----------\n")
    
    //    개발시 디버깅목적으로 사용할때, 어떤환경일때 실행하겠다. !
    #if targetEnvironment(simulator)
    print("Simulator")
    label.text = "Simulator"
    #else
    print("Device")
    label.text = "Device"
    #endif
    
    //    #if DEBUG
    //    // 시뮬에서 실행하는것 -> devug
    //    #else
    //
    //    #endif
    
    // IOS여부
    print("TARGET_OS_IOS : ", TARGET_OS_IOS)
    
    print("TARGET_OS_SIMULATOR : ", TARGET_OS_SIMULATOR)
    print("TARGET_CPU_X86 : ", TARGET_CPU_X86)
    print("TARGET_CPU_X86_64 : ", TARGET_CPU_X86_64)
    
    print("TARGET_CPU_ARM : ", TARGET_CPU_ARM)
    print("TARGET_CPU_ARM64 : ", TARGET_CPU_ARM64)
    
  }
  
  @IBAction private func deviceModel() {
    print("\n---------- [ Device Model ] ----------\n")
    
    print("name: ", device.name)
    print("model: ", device.model)
    print("localizedModel: ", device.localizedModel)
    print("userInterfaceIdiom: ", device.userInterfaceIdiom)
    print("orientation: ", device.orientation)
    print("isMultitaskingSupported: ", device.isMultitaskingSupported)
    
    //    extension
    print("modelIdentifier :", device.identifier)
    print("modelName : ", device.modelName)
    label.text = "\(device.identifier): \(device.modelName)"
    
    print(device.simulatorModelName)
  }
  
  
  // MARK: - Battery
  
  @IBAction private func battery() {
    print("\n-------------------- [ Battery Info ] --------------------\n")
    
    /*******************************
     public enum UIDeviceBatteryState : Int {
     case unknown
     case unplugged // on battery, discharging
     case charging  // plugged in, less than 100%
     case full      // plugged in, at 100%
     }
     *********************************/
    
    print("batteryState :", device.batteryState)
    print("batteryLevel :", device.batteryLevel)
    
    print("isBatteryMonitoringEnabled :", device.isBatteryMonitoringEnabled)
    label.text = "\(device.batteryState) : \(device.batteryLevel)"
  }
  
  @IBAction private func batteryMonitoring(_ sender: UIButton) {
    print("\n---------- [ batteryMonitoring ] ----------\n")
    sender.isSelected.toggle()
    device.isBatteryMonitoringEnabled.toggle()
    
    if device.isBatteryMonitoringEnabled {
      notiCenter.addObserver(
        self,
        selector: #selector(didChangeBatteryState(_:)),
        name: UIDevice.batteryLevelDidChangeNotification,
        object: nil
      )
    } else {
      // 정확한 제거를 위해 이름을 지정해서 제거 self만 사용해도가능..(?)
      notiCenter.removeObserver(
        self,
        name: UIDevice.batteryLevelDidChangeNotification,
        object: nil
      )
    }
  }
  
  @objc func didChangeBatteryState(_ noti: Notification) {
    guard let device = noti.object as? UIDevice else { return }
    print("batteryState :", device.batteryState)
    print("batteryLevel :", device.batteryLevel)
  }
  
  
  // MARK: - Proximity State
  
  // 근접센서 (카메라에 가까이가면 화면꺼짐)
  @IBAction private func proximityMonitoring(_ sender: UIButton) {
    print("\n-------------------- [ Proximity Sensor ] --------------------\n")
    sender.isSelected.toggle()
    device.isProximityMonitoringEnabled.toggle()
    print("isProximityMonitoringEnabled :", device.isProximityMonitoringEnabled)
    
    if device.isProximityMonitoringEnabled {
      notiCenter.addObserver(
        self,
        selector: #selector(didChangeProximityState(_:)),
        name: UIDevice.proximityStateDidChangeNotification,
        object: nil
      )
    } else {
      notiCenter.removeObserver(
        self,
        name: UIDevice.proximityStateDidChangeNotification,
        object: nil
      )
    }
  }
  
  @objc func didChangeProximityState(_ noti: Notification) {
    print(UIDevice.current.proximityState)
    label.text = "\(UIDevice.current.proximityState)"
  }
  
  
  // MARK: - Orientation Notification
  // 핸드폰 방향에 따른 작업
  @IBAction private func beginOrientationNotification() {
    device.beginGeneratingDeviceOrientationNotifications() // count가 쌓이는 방식 end도 같은횟수만큼 눌러줘야함
    print(device.isGeneratingDeviceOrientationNotifications)
    label.text = "\(device.isGeneratingDeviceOrientationNotifications)"
    
    notiCenter.addObserver(
      self,
      selector: #selector(orientationDidChange(_:)),
      name: UIDevice.orientationDidChangeNotification,
      object: nil
    )
  }
  
  @objc func orientationDidChange(_ noti: Notification) {
    print("\n-------------------- [ orientation DidChange ] --------------------\n")
    if let device = noti.object as? UIDevice {
      print("Device Orientation: ", device.orientation)
    }
    
    if #available(iOS 13, *) {
      let scene = UIApplication.shared.connectedScenes.first
      let orientation = (scene as! UIWindowScene).interfaceOrientation
      print("interface Orientation :",orientation)
    } else {
      let orientation = UIApplication.shared.statusBarOrientation
      print("statusBar Orientation :", orientation)
      print(orientation.isPortrait)
      print(orientation.isLandscape)
    }
    // statusBar Orientation의 값중 upsideDown은 노치있는 기기에선 미지원(iphone8 이하에선 지원)
  }
  
  @IBAction private func endOrientationNotification() {
    // 더이상 true가 아닐때까지 해줌.. begin이 count되기때문에
    while device.isGeneratingDeviceOrientationNotifications {
      device.endGeneratingDeviceOrientationNotifications()
      print("isGeneratingDeviceOrientationNotifications :", device.isGeneratingDeviceOrientationNotifications)
    }
    
    notiCenter.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    label.text = "\(device.isGeneratingDeviceOrientationNotifications)"
  }
}
```

