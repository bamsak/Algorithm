let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var groups = [String: [String]]()

for _ in 0..<n {
    let groupName = readLine()!
    for _ in 0..<Int(readLine()!)! {
        if groups[groupName] == nil {
            groups[groupName] = [readLine()!]
        } else {
            groups[groupName]?.append(readLine()!)
        }
    }
}

for _ in 0..<m {
    let input = readLine()!
    let num = Int(readLine()!)!
    
    if num == 0 {
        groups[input]!.sorted().forEach {
            print($0)
        }
        
    } else {
        print(groups.filter { $0.value.contains(input) }.keys.joined())
    }
}