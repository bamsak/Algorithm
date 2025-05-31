func foo() -> Int {
    var temp = [Int]()
    
    for _ in 0..<10 {
        temp.append(Int(readLine()!)!)
    }
    
    temp.sort(by: >)
    
    return temp[...2].reduce(0, +)
}


print("\(foo()) \(foo())")
