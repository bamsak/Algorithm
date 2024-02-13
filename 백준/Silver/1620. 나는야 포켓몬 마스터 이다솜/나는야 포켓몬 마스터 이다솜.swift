let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var dict1 = [String: Int]()
var dict2 = [Int: String]()

for i in 1...n {
    let name = readLine()!
    dict1[name] = i
    dict2[i] = name
}

for _ in 0..<m {
    let input = readLine()!
    
    if let mon = dict1[input] {
        print(mon)
    } else {
        print(dict2[Int(input)!]!)
    }
}