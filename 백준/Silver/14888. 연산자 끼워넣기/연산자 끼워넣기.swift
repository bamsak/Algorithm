let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var ops = readLine()!.split(separator: " ").map { Int($0)! }
var result = (mn: Int.max, mx: Int.min)

func dfs(_ depth: Int, _ sum: Int) {
  if depth == n {
    result = (min(result.mn, sum), max(result.mx, sum))
    return
  }
  
  for i in 0..<ops.count where ops[i] > 0 {
    ops[i] -= 1
    
    let newValue: Int
    
    switch i {
      case 0:
      newValue = sum + nums[depth]
      case 1:
      newValue = sum - nums[depth]
      case 2:
      newValue = sum * nums[depth]
      default:
      newValue = sum / nums[depth]
    }
    
    dfs(depth + 1, newValue)
    ops[i] += 1
  }
}

dfs(1, nums[0])

print(result.mx)
print(result.mn)