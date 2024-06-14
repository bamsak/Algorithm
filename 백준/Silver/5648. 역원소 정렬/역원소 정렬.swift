let narr = readLine()!.split(separator: " ").map { Int($0)! }
let n = narr[0]
var arr = [Int]()

for num in narr[1...] {
    let a = Int(String(String(num).reversed()))!
    arr.append(a)
}

while arr.count < n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    for num in input {
        arr.append(Int(String(String(num).reversed()))!)
    }
}

arr.sort()
arr.forEach { print($0) }