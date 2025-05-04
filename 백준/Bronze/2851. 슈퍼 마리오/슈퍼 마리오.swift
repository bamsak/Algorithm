var mushrooms = [Int]()

for _ in 0..<10 {
    mushrooms.append(Int(readLine()!)!)
}

for i in 1..<10 {
    mushrooms[i] += mushrooms[i - 1]
}

var prev = Int.max
var result = 0

for i in 0..<10 {
    let temp = abs(100 - mushrooms[i])
    if temp <= prev {
        prev = temp
        result = mushrooms[i]
    }
}

print(result)
