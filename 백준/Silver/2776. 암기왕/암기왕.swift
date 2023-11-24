var result = ""

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    let nDiary = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    let m = Int(readLine()!)!
    let mDiary = readLine()!.split(separator: " ").map { Int($0)! }
    
    for num in mDiary {
        var left = 0
        var right = n - 1
        
        while left <= right {
            var mid = (left + right) / 2
            
            if num < nDiary[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        if right < 0 {
            right += 1
        }
        
        result += nDiary[right] == num ? "1\n" : "0\n"
    }
}

result.removeLast()
print(result)
