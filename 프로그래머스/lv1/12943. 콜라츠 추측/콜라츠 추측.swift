func solution(_ num:Int) -> Int {
    var count: Int = 0
    var result: Int = num
    
    while result != 1 {
        if result % 2 == 0 {
            result = result / 2
            count += 1
        } else if result % 2 != 0 {
            result = (result * 3) + 1
            count += 1
        }
    }
    
    if result == 1 && count < 500 {
        return count
    } else {
        return -1
    }
  
}