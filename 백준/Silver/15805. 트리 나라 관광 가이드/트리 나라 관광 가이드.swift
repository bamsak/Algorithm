let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let count = Set(nums).count
var visited = Array(repeating: -1 , count: count)

for i in 1..<n {
  if visited[nums[i]] == -1 {
    visited[nums[i]] = nums[i - 1]
  }
}
visited[nums[0]] = -1
print(count)

print(visited.map { String($0) }.joined(separator: " "))