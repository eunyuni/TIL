# NetWorking

## Concurrency(동시성) & Parallelism(병렬성)

* 일의 과정 (배달회사)

  * 전화로 주문받음 (2분 소요)
  * 주문 받은 내용대로 음식점에서 구매 (10분)
  * 음식 받아서 배달완료 (10분)

* Concurrency 동시성

  - 주문을 언제든지 받자! (동시성)

  - 전화주문 먼저받자! (동시성)

  - 주문을 먼저받았더니 동시성은 높지만 완료가 오래걸림

* Parallelism 병렬성
  * 완료가 오래걸리니 일할사람을 늘리자!(병렬성)이

* Thread

  - 일하는사람
  - Main Thread -> 느려지는 작업이나 복잡한 계산의일은 다른스래드를 통해 시킨다

  

## Queue, Sync & ASync

* Queue
  * 수첩에 해야할 일들의 목록을 작성 (todolist..)
* Sync
  * 일의 순서대로 실행
  * 앞의일이 다 끝나야 뒤의 일을 시작
* ASync
  * 앞의 일이 다끝나기도 전에 일을 시행
  * 동시다발적으로 수행

* App
  * 여러 Thread를 이용해 작업을 실행하는데, Thread는 Queue에 있는 작업을 순서대로 실행한다.
  * 순서대로 실행하는 방식으로 Sync, ASync가 있다.



## GCD (Grand Central Patch)

* Gcd란?
  * 해야할일(Code)을 만들어서 Gcd에게 넘겨주면 시스템에서 알아서 스래드 할당해 안전하게 수행해준다.

* How?
  * 어떤큐를 사용할것인지 (main, grobal)
  * 작업의 방식은 뭘로할지 (QoS)



### 1. Queue

* The Main Queue
  * 가장높은 우선순위. 메인 스래드에서 작업수행. 모든 UI관련 작업은 메인큐에서 이뤄져야함.

```swift
//Main Queue
DispatchQueue.main.async{
  // Do Any UI Update Here
}
```

* The Global Queue
  * Qos (Quality of Service)

    1. `userInteractive` : 메인스래드에서 사용자가 터치하는것을 인식하듯이 바로 실행해야 할 작업

    2. `userInitiated` : 작업이 바로수행되야 할 것들. 몇초안걸리는 작업들

    3. `default` : 거의안씀. 2번보다 좀 더 걸리는 작업

    4. `utility` : 수초 ~ 수분 정도 걸리는 작업 (30초~3분정도의 작업), 나름무거운작업
    5. `Background` : 작업이 꽤 걸리는일. 수분~ 몇시간정도, 무거운작업 ex)대용량 파일 다운, 큰 계산

```swift
//Main Queue
DispatchQueue.global(qos: .background).async{
  // Do Heavey Work Here
}
```

* Custom Queue
  * 우리가 직접 큐를 생성해서 관리 사용용도에 맞게 설정. 

```swift
//Custom Queue
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serial", qos: .background)
```

* 두개의 큐사용
  * 의존성이있는 작업들. 큰이미지를 다운받고 다받으면 그때 해당하는 이미지를 화면에 띄울때 등

```swift
DispatchQueue.global(qos: .background).async{
    // 많이걸리는 작업으로 글로벌 백그라운드로 작업
  let image = downLoadImageFromServer()
  	// 다되면 그후 메인에서 뷰를 띄움
  DispatchQueue.main.async{
    self.imageView.image = image
	}
}
```



### Sync & ASync

* ASync -> 😈 먼저작업이 끝남

```swift
DispatchQueue.global(qos: .background).async{
	for i in 0...5 {
    print("😍\(i)")
  }
}
DispatchQueue.global(qos: .userInteractive).async{
	for i in 0...5 {
    print("😈\(i)")
  }
}
```



* Sync -> 아무리 우선순위가 낮은 작업이더래도 먼저 😍 다끝나야 😈 실행됨

```swift
DispatchQueue.global(qos: .background).sync{
	for i in 0...5 {
    print("😍\(i)")
  }
}
DispatchQueue.global(qos: .userInteractive).async{
	for i in 0...5 {
    print("😈\(i)")
  }
}
```

* 무거운 작업을 Sync로 돌리면 뒤의 작업이 실행이안됨