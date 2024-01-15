let nx = readLine()!.split(separator: " ").map { Int($0)! }
let (_, x) = (nx[0], nx[1])
let inputs = readLine()!.split(separator: " ").map{ Int($0)! }

for input in inputs {
    if input < x {
        print("\(input)", terminator: " ")
    }
}
