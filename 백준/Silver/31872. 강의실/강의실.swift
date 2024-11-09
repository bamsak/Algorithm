let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let array = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var temp = [Int]()
temp.append(array[0])

for i in 0..<n - 1 {
    temp.append(abs(array[i] - array[i + 1]))
}

print(array.last! - temp.sorted(by: >)[..<k].reduce(0, +))