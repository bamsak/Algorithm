var dict = [Int: Int]()

for _ in 0..<Int(readLine()!)! {
    let input = Int(readLine()!)!
    
    if dict[input] == nil {
        dict[input] = 1
    } else {
        dict[input]! += 1
    }
}

let result = dict.max {
    if $0.value == $1.value {
        return $0.key > $1.key
    }
    return $0.value < $1.value
}!.key

print(result)