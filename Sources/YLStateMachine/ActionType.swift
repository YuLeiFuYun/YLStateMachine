//
//  ActionType.swift
//  YLStateMachine
//
//  Created by 玉垒浮云 on 2020/8/21.
//

import Foundation

public protocol ActionType {
    associatedtype State: StateType
    var transitionState: State { get }
}
