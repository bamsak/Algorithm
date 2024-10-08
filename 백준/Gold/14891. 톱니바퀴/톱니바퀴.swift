var gears = [[Int]]()

for _ in 0..<4 {
    gears.append(readLine()!.map { Int(String($0))!})
}

for _ in 0..<Int(readLine()!)! {
    let nd = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, d) = (nd[0] - 1, nd[1])
    
    var directions = Array(repeating: 0, count: 4)
    directions[n] = d
    
    for i in n..<3 {
        if gears[i][2] != gears[i + 1][6]  {
            directions[i + 1] = -directions[i]
        } else {
            break
        }
    }
    
    for i in stride(from: n, to: 0, by: -1) {
        if gears[i][6] != gears[i - 1][2] {
           directions[i - 1] = -directions[i]
        } else {
            break
        }
    }
    
    for i in 0..<directions.count where directions[i] != 0{
        if directions[i] == 1 {
            turnClock(i)
        } else {
            turnReverse(i)
        }
    }
}

func turnClock(_ index: Int) {
    let top = gears[index].removeLast()
    gears[index].insert(top, at: 0)
}

func turnReverse(_ index: Int) {
    let top = gears[index].removeFirst()
    gears[index].append(top)
}

var result = 0

for i in 0..<gears.count where gears[i][0] == 1 {
    result += [1, 2, 4, 8][i]
}
print(result)
