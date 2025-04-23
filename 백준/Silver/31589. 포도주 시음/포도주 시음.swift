let nk = readLine()!.split(separator: " ").map { Int($0)! }
var (n, k) = (nk[0], nk[1])
var array = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var result = array.removeLast()
k -= 1
var left = 0
var right = array.count - 1

while k > 1 {
  result += array[right] - array[left]
  left += 1
  right -= 1
  k -= 2
}

print(result)
