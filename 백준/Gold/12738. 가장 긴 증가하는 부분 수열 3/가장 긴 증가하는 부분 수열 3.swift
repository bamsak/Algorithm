let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var temp = [Int]()

for num in nums {
    if let last = temp.last, last >= num {
        var left = 0
        var right = temp.count - 1
        
        while left < right {
            let mid = (left + right) / 2
            
            if temp[mid] >= num {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        temp[left] = num
    } else {
        temp.append(num)
    }
}

print(temp.count)
