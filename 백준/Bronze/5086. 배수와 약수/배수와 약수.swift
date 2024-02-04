while true {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    
    if xy == [0, 0] {
        break
    }
    
    let (x, y) = (xy[0], xy[1])
    
    if  y % x == 0 {
        print("factor")
    } else if x % y == 0 {
        print("multiple")
    } else {
        print("neither")
    }
}
