let n = Int(readLine()!)!
let t = readLine()!.split(separator: " ").map { String($0) }
var set = Set<String>()
for str in t {
    if str.hasSuffix("Cheese") {
        set.insert(str)
    }
}

print(set.count > 3 ? "yummy" : "sad")