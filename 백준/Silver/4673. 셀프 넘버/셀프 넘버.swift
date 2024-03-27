var nums = Set<Int>()

for i in 1...10000 {
    let sum = ("\(i)".map { Int(String($0))! }.reduce(0, +)) + i
    nums.insert(sum)
}

for j in 1...10000 {
    if nums.contains(j) == false { print(j) }
}