var dict = [String: Int]()

for _ in 0..<Int(readLine()!)! {
    let name = readLine()!.map { String($0) }
    
    if let _ = dict[name[0]] {
        dict[name[0]]! += 1
    } else {
        dict[name[0]] = 1
    }
}

let foo = dict.filter { $0.value > 4 }.keys

if foo.count > 0 {
    var result = ""
    foo.sorted().forEach { result += $0 }
    print(result)
} else {
    print("PREDAJA")
}
