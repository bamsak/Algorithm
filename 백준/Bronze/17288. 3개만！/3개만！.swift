let input = readLine()!.map { Int(String($0))! }
var result = 0
var arr = [input[0]]

for i in 1..<input.count {
    if input[i - 1] == (input[i] - 1) {
        arr.append(input[i])
    } else {
        if arr.count == 3 {
            result += 1
        }
        arr = [input[i]]
    }
}

if arr.count == 3 {
    result += 1
}

print(result)