let n = Int(readLine()!)!
var map = [[String]]()

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { String($0) })
}

var dp = Array(repeating: Array(repeating: (mini: Int.max, maxi: Int.min), count: n), count: n)

dp[0][0] = (Int(map[0][0])!, Int(map[0][0])!)

for y in 0..<n {
    for x in 0..<n {
        if y == 0 && x == 0 { continue }
        
        guard let num = Int(map[y][x]) else { 
            if y > 0 {
                dp[y][x].mini = min(dp[y][x].mini, dp[y - 1][x].mini)
                dp[y][x].maxi = max(dp[y][x].maxi, dp[y - 1][x].maxi)
            }

            if x > 0 {
                dp[y][x].mini = min(dp[y][x].mini, dp[y][x - 1].mini)
                dp[y][x].maxi = max(dp[y][x].maxi, dp[y][x - 1].maxi)    
            }
            continue
        }
        
        if y > 0 && dp[y-1][x].mini != Int.max {
            dp[y][x].mini = min(dp[y][x].mini, calculate(dp[y - 1][x].mini, num, map[y - 1][x]))
            dp[y][x].maxi = max(dp[y][x].maxi, calculate(dp[y - 1][x].maxi, num, map[y - 1][x]))
        }
    
        if x > 0 && dp[y][x-1].mini != Int.max {
            dp[y][x].mini = min(dp[y][x].mini, calculate(dp[y][x - 1].mini, num, map[y][x - 1]))
            dp[y][x].maxi = max(dp[y][x].maxi, calculate(dp[y][x - 1].maxi, num, map[y][x - 1]))
        }
    }
}

func calculate(_ a: Int, _ b: Int, _ op: String) -> Int {
    switch op {
    case "+": return a + b
    case "-": return a - b
    case "*": return a * b
    default: return a
    }
}


print(dp[n-1][n-1].maxi, dp[n-1][n-1].mini)