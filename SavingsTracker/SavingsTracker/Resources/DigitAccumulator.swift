//
//  DigitAccumulator.swift
//  RPN
//
//  Created by Andrew Lao on 9/19/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation

public enum DigitAccumulatorError: Error {
    case extraDecimalPoint
    case invalidDigitNumberValue
    case emptyValue
    case invalidCurrency
}

public struct DigitAccumulator {
    public enum Digit: Equatable {
        case decimalPoint
        case number(Int)
    }
    
    
    public init(){
        
    }
    
    public mutating func add(digit: Digit) throws {
        switch digit {
        case .decimalPoint:
            if hasDecimal {
                throw DigitAccumulatorError.extraDecimalPoint
            }
            hasDecimal = true
        case .number(let value):
            guard value >= 0 || value <= 9 else {
                throw DigitAccumulatorError.invalidDigitNumberValue
            }
            if !hasDecimal {
                wholeComponent.append(digit)
            } else {
                guard fractionalComponent.count < 4 else {
                    throw DigitAccumulatorError.invalidCurrency
                }
                let index = fractionalComponent.count == 2 ? 0 : 1
                fractionalComponent.insert(digit, at: index)
            }
            
        }

    }
    
    public mutating func delete() throws {
        if wholeComponent.isEmpty  {
            throw DigitAccumulatorError.emptyValue
        }
        if hasDecimal {
            if fractionalComponent.count <= 2 {
                hasDecimal = false
                wholeComponent.removeLast()
            } else {
                let index = fractionalComponent.count == 4 ? 1 : 0
                fractionalComponent.remove(at: index)
            }
        } else {
            wholeComponent.removeLast()
        }
    
    }
    
    func wholeStringValue() -> String {
        return createString(array: wholeComponent)
    }
    func fractionalStringValue() -> String {
        let result = createString(array: fractionalComponent)
        
        return String(result.prefix(2))
    }
    private func createString(array:[Digit]) -> String {
        return array.map { (digit) -> String in
            switch digit {
            case let .number(x): return String(x)
            case .decimalPoint: return "."
            }
            }.joined()
    }
    public func stringValue() -> String {
        let wholeValue = wholeComponent.isEmpty ? "0" : wholeStringValue()
        return wholeValue + "." + fractionalStringValue()
    }
    
    private var hasDecimal = false
    private var wholeComponent = [Digit]()
    private var fractionalComponent: [Digit] = [Digit.number(0),Digit.number(0)]
}

