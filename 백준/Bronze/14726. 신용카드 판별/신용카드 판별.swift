for _ in 0..<Int(readLine()!)! {
    var numbers = [Int]()
    let cn = readLine()!
    cn.enumerated().forEach { index, number in
        if index % 2 == 0 {
            if Int(String(number))! * 2 < 10 {
                numbers.append(Int(String(number))! * 2)
            } else {
                numbers.append(String(Int(String(number))! * 2).map { Int(String($0))! }.reduce(0, +))
            }
        } else {
            numbers.append(Int(String(number))!)
        }
    }
    let sum = numbers.reduce(0, +)
    
    if sum % 10 == 0 {
        print("T")
    } else {
        print("F")
    }
}

