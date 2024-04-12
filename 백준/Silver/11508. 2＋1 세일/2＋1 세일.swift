var costs = [Int]()

for _ in 0..<Int(readLine()!)! {
    costs.append(Int(readLine()!)!)
}

costs.sort(by: >)

var result = 0

for i in 0..<costs.count where (i + 1) % 3 != 0 {
    result += costs[i]
}

print(result)