while true {
    let xyz = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    let (x, y, z) = (xyz[0], xyz[1], xyz[2])
    guard x != 0 && y != 0 && z != 0 else { break }
    
    if (x * x) + (y * y) == (z * z) {
        print("right")
    } else {
        print("wrong")
    }
}
