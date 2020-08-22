//
//  StateMachine.swift
//  YLStateMachine
//
//  Created by 玉垒浮云 on 2020/8/21.
//

import Foundation

public class StateMachine<Operator: OperatorType>: NSObject {
    public var completionHandler: (() -> Void)?
    
    public private(set) var `operator`: Operator
    
    public private(set) var currentState: Operator.Action.State = .initialState {
        didSet {
            switch currentState.stability {
            case .transitional:
                `operator`.startTransition(currentState)
            case .stable:
                `operator`.endTransition(oldValue)
                completionHandler?()
            }
        }
    }
    
    public init(operator: Operator) {
        self.`operator` = `operator`
    }
    
    public func trigger(_ action: Operator.Action, completion: (() -> Void)? = nil) {
        guard currentState.stability != .transitional else { return }
        currentState = action.transitionState
        
        `operator`.transition(with: action) { (state) in
            self.currentState = state
            completion?()
        }
    }
}
