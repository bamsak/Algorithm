func solution(_ x:Int) -> Bool {
    let str: String = String(x)
    var someInt: Int = 0
    for char in str {
        someInt += Int(String(char)) ?? 0
    }
    if x % someInt == 0  {
        return true    
    } else {
        return false
    }
    
}