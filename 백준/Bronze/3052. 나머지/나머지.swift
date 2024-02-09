var s = Set<Int>()

for _ in 0..<10 {
    let i = Int(readLine()!)! % 42
    s.insert(i)
}

print(s.count)