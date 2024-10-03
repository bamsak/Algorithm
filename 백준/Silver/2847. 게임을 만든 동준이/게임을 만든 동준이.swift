var levels = [Int]()

for _ in 0..<Int(readLine()!)! {
    levels.append(Int(readLine()!)!)
}

var result = 0

for i in (1..<levels.count).reversed() {
    if levels[i - 1] >= levels[i] {
        result += levels[i - 1] - levels[i] + 1
        levels[i - 1] -= levels[i - 1] - levels[i] + 1
    }
}

print(result)