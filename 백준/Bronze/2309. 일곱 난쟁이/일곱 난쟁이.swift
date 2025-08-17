var heights = [Int]()

for _ in 0..<9 {
    let h = Int(readLine()!)!
    heights.append(h)
}

let total = heights.reduce(0, +)

var result = [Int]()
outer: for i in 0..<9 - 1 {
    for j in i + 1..<9 {
        if total - (heights[i] + heights[j]) == 100 {
            result = heights.enumerated().filter { $0.offset != i && $0.offset != j }.map { $0.element }.sorted()
            break outer
        }
    }
}

result.forEach {
    print($0)
}
