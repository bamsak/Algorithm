let ng = readLine()!.split(separator: " ")
let (n, game) = (Int(ng[0])!, ng[1])
let maximum = game == "Y" ? 2 : game == "F" ? 3 : 4
var dict = [String: Bool]()
var count = 0
var result = 0

for _ in 0..<n {
    let name = readLine()!
    if let _ = dict[name] {
        continue
    } else {
        dict[name] = true
        count += 1
    }
    
    if count == maximum - 1 {
        result += 1
        count = 0
    }
}

print(result)