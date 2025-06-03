var temp = [String: [String]]()

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { String($0) }
    
    if input[1] == "-" { continue }
    
    if temp[input[1]] == nil {
        temp[input[1]] = [input[0]]
    } else {
        temp[input[1]]?.append(input[0])
    }
}

let result = temp.filter { $0.value.count == 2 }.values

print(result.count)

if result.count > 0 {
    result.forEach {
        print($0.joined(separator: " "))
    }
}
