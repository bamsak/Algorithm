let ab = readLine()!.split(separator: " ").map { Int($0)! }

func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    
    while b != 0 {
        let t = a % b
        a = b
        b = t
    }
    
    return a
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

print(lcm(ab[0], ab[1]))
