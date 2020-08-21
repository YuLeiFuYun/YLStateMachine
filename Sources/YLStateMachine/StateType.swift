//
//  StateType.swift
//  YLStateMachine
//
//  Created by 玉垒浮云 on 2020/8/21.
//

import Foundation

/// 状态的稳定性：稳定的 or 过渡的
public enum Stability {
    case stable
    case transitional
}

public protocol StateType {
    var stability: Stability { get }
    static var initialState: Self { get }
}
