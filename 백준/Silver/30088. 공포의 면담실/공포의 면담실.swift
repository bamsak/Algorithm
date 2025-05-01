var array = [Int]()

for _ in 0..<Int(readLine()!)! {
    let times = readLine()!.split(separator: " ").map { Int($0)! }
    let t = times[1...].reduce(0, +)
    array.append(t)
}

array.sort()

for i in 1..<array.count {
    array[i] += array[i - 1]
}

print(array.reduce(0, +))
