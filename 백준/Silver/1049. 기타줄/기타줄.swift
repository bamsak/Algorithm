let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var package = [Int]()
var piece = [Int]()

for _ in 0..<m {
    let cost = readLine()!.split(separator: " ").map { Int($0)! }
    package.append(cost[0])
    piece.append(cost[1])
}
let minPac = package.min()!
let minPie = piece.min()!

let pacCost = minPac * (n / 6) + minPac
let pieCost = minPie * n
let r = minPac * (n / 6) + minPie * (n % 6)

print(min(pacCost, pieCost, r))