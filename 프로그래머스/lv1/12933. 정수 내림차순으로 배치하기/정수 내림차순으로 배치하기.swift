func solution(_ n:Int64) -> Int64 {
    let str: String = String(n)
    var arr: [Int] = []
    var result: String = ""
    
    for char in str {
        arr.append(Int(String(char))!)
    }
    
    let arr2: [Int] = arr.sorted(by: >)
    
    for i in arr2 {
        result += String(i)
    }
    
    return Int64(result)!
}