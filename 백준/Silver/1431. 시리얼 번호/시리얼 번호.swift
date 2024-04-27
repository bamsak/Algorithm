var serial = [String]()

for _ in 0..<Int(readLine()!)! {
    serial.append(readLine()!)
}

serial.sort {
    if $0.count != $1.count {
        return $0.count < $1.count
    }
    
    let temp1 = $0.compactMap { Int(String($0)) }.reduce(0, +)
    let temp2 = $1.compactMap { Int(String($0)) }.reduce(0, +)
    
    if temp1 == temp2 {
        return $0 < $1
    }
    
    return temp1 < temp2
}

serial.forEach { print($0, terminator: "\n") }
