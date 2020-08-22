# YLStateMachine
## Requirements

* iOS 13.0+
* Swift 5.1+



## Installation

### Cocoapods

To integrate YLStateMachine into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks!

target 'MyApp' do
  # your other pod
  # ...
  pod 'YLStateMachine'
end
```

Run `pod install` to build your dependencies.



### Swift Package Manager

Select File > Swift Packages > Add Package Dependency. Enter `https://github.com/YuLeiFuYun/YLStateMachine.git` in the "Choose Package Repository" dialog.



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

Create a state machine:

```swift
let refreshOperator = RefreshOperator()
let refreshStateMachine = StateMachine(operator: refreshOperator)
```

Finally, using this state machine.

```swift
refreshStateMachine.trigger(someAction) {
    ...
}
```



## License

YLStateMachine is released under the MIT license. See LICENSE for details.