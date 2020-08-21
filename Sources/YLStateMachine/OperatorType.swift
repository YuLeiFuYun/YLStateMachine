//
//  OperatorType.swift
//  YLStateMachine
//
//  Created by 玉垒浮云 on 2020/8/21.
//

import Foundation

public protocol OperatorType {
    associatedtype Action: ActionType
    
    /// 开始过渡前调用
    func startTransition(_ state: Action.State)
    /// 过渡时调用
    func transition(with action: Action, completion: @escaping (Action.State) -> Void)
    /// 结束过渡后调用
    func endTransition(_ state: Action.State)
}

extension OperatorType {
    public func startTransition(_ state: Action.State) { }
    public func endTransition(_ state: Action.State) { }
}
