//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

enum InputError: Error {
    case invalid(String)
    case tooShort
}

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let opTest = Int(args[args.count-1])
        if opTest == nil{
            let op = args[args.count-1]
            var nums = args
            nums.removeLast()
            let numbers = nums.map {(string:String)-> Int in return Int(string)!}
            return calAdvanced(numbers: numbers, op: op)
        } else{
            let op = args[1]
            let n1 = Int (args[0])!
            let n2 = Int (args[2])!
            
            return calcBasic(n1: n1, n2: n2, op: op)
        }
        
        
    }
    
    public func calAdvanced(numbers:[Int], op:String) -> Int{
        var result:Int = 0
        switch op {
            case "count":
                result = Int(numbers.count)
            case "avg":
                let total:Int = numbers.reduce(0, +)
                let count = numbers.count
                if count == 0{
                    result = 0
                } else{
                    result = total / count
                }
            case "fact":
                if numbers.count == 0{
                    result = 0
                } else {
                    result = calcFact(factor: numbers[0])
                }
            default:
                print("invalid operator")
        }
        return result
    }
    
    public func calcFact(factor: Int)->Int{
        if (factor == 0 || factor == 1 ){
            return 1
        } else {
            return (1...factor).reduce(1, {a, b in a * b})
        }
    }
    
    public func calcBasic(n1: Int, n2: Int, op: String) -> Int {
        var result:Int
        switch op {
        case "+":
            result = n1 + n2
        case "-":
            result = n1 - n2
        case "*":
            result = n1 * n2
        case "/":
            result = n1 / n2
        case "%":
            result = n1 % n2
        default:
            print("Invaid Operator")
            result = 0
        }
        return result
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns, or just type SimpleCalc followed by expression:")
let first = readLine()!
if first.contains("SimpleCalc"){
    let expression = first.replacingOccurrences(of: "SimpleCalc ", with: "")
    print(Calculator().calculate(expression))
} else {
    let operation = readLine()!
    let second = readLine()!
    print(Calculator().calculate([first, operation, second]))
}


