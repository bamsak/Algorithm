var result = [Int]()

let k = Int(readLine()!)!

for _ in 1...k {
    let input = Int(readLine()!)!
    
    if input == 0 {
        result.removeLast()
    } else {
        result.append(input)
    }
}

print("\(result.reduce(0, +))")
