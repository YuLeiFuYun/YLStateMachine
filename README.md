# YLStateMachine
## Usage

Create a “state" adopts and conforms to the StateType protocol:

```swift
enum RefreshState: StateType {
    case initial
    case refreshing
    case paginated
	...
    
    var stability: Stability {
        switch self {
        case .refreshing:
            return .transitional
        default:
            return .stable
        }
    }
    
    static var initialState: RefreshState {
        return .initial
    }
}
```

Create a “action” adopts and conforms to the ActionType protocol:

```swift
enum RefreshAction: ActionType {
    case pullToRefresh
    case loadingMore
    
    var transitionState: RefreshState {
        switch self {
        ...
        }
    }
}
```

Create a “operator” adopts and conforms to the OperatorType protocol:

```swift
class RefreshOperator: OperatorType {
    typealias Action = RefreshAction
    ...
    
    // Optional
    func startTransition(_ state: Action.State) {
        ...
    }
    
    // Required
    func transition(with action: RefreshAction, completion: @escaping (RefreshState) -> Void) {
        ...
    }
    
    // Optional
    func endTransition(_ state: Action.State) {
        ...
    }
}
```

Finally, create a state machine:

```swift
let refreshOperator = RefreshOperator()
let refreshStateMachine = YLStateMachine(operator: refreshOperator)
...
```



## Installation

### Cocoapods

To integrate YLStateMachine into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'YLStateMachine'
```

Run `pod install` to build your dependencies.



### Swift Package Manager

Update your `Package.swift` file：

```swift
// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    dependencies: [
        .package(url: "https://github.com/YuLeiFuYun/YLStateMachine.git", from: "1.0.0"),
    ],
    ...
)
```



## License

YLStateMachine is released under the MIT license. See LICENSE for details.