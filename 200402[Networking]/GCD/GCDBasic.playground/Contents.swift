import UIKit

// MARK: -Queue

// - Main Queue
DispatchQueue.main.async {
  // UI update
  let view = UIView()
  view.backgroundColor = .gray
}

// - global Queue
DispatchQueue.global(qos: .userInteractive).async {
  // 0.1 ~ 1초 사이의 작업
}

DispatchQueue.global(qos: .userInitiated).async {
  // 2 ~ 10초 사이의 작업
}

DispatchQueue.global(qos: .utility).async {
  // 5 ~ 15분 사이의 작업
}

DispatchQueue.global(qos: .background).async {
  // 30 ~ 1시간 .. 그이상의 작업
}


// - Custom Queue
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serial", qos: .background)


// MARK: -Async, Sync


// - Async

// 두개의 일이있는데 앞의일은 시간나면 해줘 정도의 작업, 뒤에건 먼저해죵
// 작업은 어싱크로 수행
DispatchQueue.global(qos: .background).async {
    for i in 0...5 {
        print("😈 \(i)")
    }
}

// 위의것과 똑같지만 우선순위가 급한 것!
// 작업은 어싱크로 수행
DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("😥 \(i)")
    }
}

// - Sync

// Sync로 실행. 이것이 실행되기 전까진 뒤에것을 실행할 수 없엉!
// 우선순위가 낮더라도..
DispatchQueue.global(qos: .background).sync {
    for i in 0...5 {
        print("😈 \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("😥 \(i)")
    }
}
