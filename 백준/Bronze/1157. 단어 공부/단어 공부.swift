let a = readLine()!.uppercased()
var dict = [Character: Int]()
for i in a {
    if dict[i] == nil {
        dict[i] = 1
    } else {
        dict[i]! += 1
    }
}
let f = dict.filter { $0.value == dict.values.max()! }
f.count > 1 ? print("?") : print(f.keys.first!)
