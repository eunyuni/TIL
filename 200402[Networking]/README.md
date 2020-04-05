# NetWorking



## 1. Concurrency(동시성) & Parallelism(병렬성) & Serial(직렬)

* **일의 과정 (배달회사)**

  * 전화로 주문받음 (2분 소요)
  * 주문 받은 내용대로 음식점에서 구매 (10분)
  * 음식 받아서 배달완료 (10분)

* **Concurrency 동시성**

  - 주문을 언제든지 받자! (동시성)
  - 전화주문 먼저받자! (동시성)
  - 주문을 먼저받았더니 동시성은 높지만 완료가 오래걸림
  - 각자 **독립적이지만 유사한 여러개의 작업**을 처리 할 때
  - 분산처리시킨 작업을 여러개의 쓰레드에서 동시에 처리

* **Parallelism 병렬성**
  
* 완료가 오래걸리니 일할사람을 늘리자!(병렬성)이
  * 분산처리시킨 작업을 한개의 쓰레드에서 처리
  
* **Serial 직렬성**

  * **순서가 중요한 작업**을 처리 할 때

* **Thread**

  - **일하는사람**
  - Main Thread -> 느려지는 작업이나 복잡한 계산의일은 다른스래드를 통해 시킨다

  

## 2. Queue, Sync & ASync

* **Queue**
  * 수첩에 해야할 일들의 목록을 작성 (todolist..)
  * **대기행렬/대기열**
  * 직접적으로 쓰레드를 관리하지 않고 **Queue를 이용해 작업을 분산 처리**
* **Sync**
  * 일의 **순서대로** 실행
  * 앞의일이 다 끝나야 뒤의 일을 시작
* **ASync**
  * 앞의 일이 다끝나기도 전에 일을 시행
  * **동시다발적으로** 수행

* **App**
  * 여러 Thread를 이용해 작업을 실행하는데, Thread는 Queue에 있는 작업을 순서대로 실행한다.
  * 순서대로 실행하는 방식으로 Sync, ASync가 있다.



## 3. GCD (Grand Central Patch)

* **Gcd란?**
  * 해야할일(Code)을 만들어서 Gcd에게 넘겨주면 시스템에서 알아서 스래드 할당해 안전하게 수행해준다.
* 다른 쓰레드에서 (오래걸리는) 작업들이 "비동기적으로 동작"하도록 만들어 줌
  * 시스템에서 알아서 쓰레드 숫자를 관리함
  * 쓰레드보다 높은 차원/레벨 에서 일을 하는것
  
* **How?**
  * 어떤큐를 사용할것인지 (main, grobal)
  * 작업의 방식은 뭘로할지 (QoS)



### 1. Queue

* 대기열마다 특성이 다르기에, 작업의 특성에 따라 원하는 일처리에 맞게 보내면 된다.
* **DispatchQueue**

| 생성 코드 | 생성 코드                   | 특 징                                                        | 직렬/동시                                 |
| --------- | --------------------------- | ------------------------------------------------------------ | ----------------------------------------- |
| .main     | DispatchQueue.main          | Main Queue<br />1번 쓰레드, UI내용처리                       | Serial<br />(직렬)                        |
| .global() | DispatchQueue.global(qos: ) | 6가지 Qos<br />시스템이 우선순위에 따라 배치, <br />배터리를 더 집중해서 사용 | Concurrent<br />(동시)                    |
| Custom    | DispatchQueue(label: "...") | Qos추론 / Qos설정가능                                        | 디폴트: Serial<br />attributes로 설정가능 |



* **The Main Queue**
  * 가장높은 우선순위. 메인 스래드에서 작업수행. 모든 UI관련 작업은 메인큐에서 이뤄져야함.
  * 한개이자 직렬성이다. 1번 스레드이자 메인큐.

```swift
//Main Queue
DispatchQueue.main.async{
  // Do Any UI Update Here
  // 메인큐에 비동기적으로 보낼것이다.
}
```

* **The Global Queue**
  * Qos (Quality of Service)


| 구                    분 | 사용해야 하는 상황                                           |   소요 시간   |
| :----------------------- | ------------------------------------------------------------ | :-----------: |
| .userInteractive         | 사용자 터치를 인식하듯 바로 실행해야할 작업<br />유저와 직접적인 인터렉티브: UI업데이트, 애니메이션, 사용자와의 상호작용 |   거의 즉시   |
| .userInitiated           | 작업이 바로수행되야 할 것들. 몇초안걸리는 작업들, 즉시필요하지만<br />비동기적으로 처리된 작업 |     몇 초     |
| .default                 | 거의안씀. 2번보다 좀 더 걸리는 작업, 일반적인 작업들         |       -       |
| .utility                 | 나름무거운작업, 계산, IO, Networking                         | 몇초 ~ 몇 분  |
| .Background              | 작업이 꽤 걸리는일. <br />무거운작업  유저가 직접적으로 인지하지 않고(시간이 안 중요한)작업 <br />ex)대용량 파일 다운, 큰 계산, 데이터 미리가져오기, 데이터베이스 유지 | 수분~ 몇 시간 |



```swift
//Main Queue
DispatchQueue.global(qos: .background).async{
  // Do Heavey Work Here
}
```

* **Custom Queue**
  * 우리가 직접 큐를 생성해서 관리 사용용도에 맞게 설정. 
  * 직렬성, 원하면 병렬도 가능, 서비스 품질도(Qos)변경 가능

```swift
//Custom Queue
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serial", qos: .background)
```

* **두개의 큐사용**
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



### 디스패치큐(GCD) 사용 시 주의할점

#### 1) 반드시 메인큐에서 처리해야 하는 작업

* UI관련 작업

#### 2) sync 메서드에 대한 주의사항

* 메인큐에서는 **항상 비동기적으로** 보내야 한다. sync메서드 금지
* 현재의 큐에서 현재의 큐로 **동기적으로** 보내서는 안된다. / *교착상황 발생*

#### 3) weak, strong캡처 주의

* [weak self]로 비동기 작업을 처리해야 카운트가 증가하지않음

#### 4) 컴플리션 핸들러의 존재 이유

* 작업이 끝남을 알리는 존재로
* 작업이 종료되지 않았는데 해당값에 접근하면 잘못된 값을 사용할 확률이 높다.
* 비동기 작업이 끝났다는것을 정확히 알려주는 시점이 컴플리션 픈들러이다.
* 비동기 함수와 관련된 작업은 모두 컴플리션 핸들러를 가지고 있다.

#### 5) 동기적 함수를 비동기 함수처럼 만드는 방법

* 재활용을 하기위해
* 오래걸리는 동기적작업처리를 내부적으로 비동기적으로 만들기위해 동기적함수를 비동기적 함수로 만든다. 이렇게 하면 함수를 사용할 때마다 비동기처리를 할 필요없이 자동으로 비동기 처리가되므로 재활용이 용이하다.











* 참고강의
  *  패스트캠퍼스 / 올인원 패키지 / 모바일 앱 개발 
  * 인프런Concurrency(동시성) 프로그래밍, 동기 비동기 처리 그리고 GCD/Operation - 디스패치큐와 오퍼레이션큐의 이해 -> https://www.inflearn.com/course/iOS-Concurrency-GCD-Operation# 











