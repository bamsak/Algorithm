let n = Int(readLine()!)!
let aNumbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let m = Int(readLine()!)!
let mArr = readLine()!.split(separator: " ").map { Int($0)! }


for number in mArr {
    var left = 0
    var right = n - 1
    
    var check = false
    
    while left <= right {
        let mid = (left + right) / 2
        
        if number < aNumbers[mid] {
            right = mid - 1
        } else {
            left = mid + 1
        }
        
        if number == aNumbers[mid] {
            check = true
            break
        }
    }
    print("\(check ? 1 : 0)")
}
