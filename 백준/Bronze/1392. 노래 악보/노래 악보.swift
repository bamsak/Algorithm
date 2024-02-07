let nq = readLine()!.split(separator: " ").map { Int($0)! }
let (n, q) = (nq[0], nq[1])

var times = [Int]()

for i in 0..<n {
    let time = Int(readLine()!)!
    
    for _ in 0..<time {
        times.append(i + 1)
    }
}

for _ in 0..<q {
    print(times[Int(readLine()!)!])
}