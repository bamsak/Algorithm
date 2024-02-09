let r = readLine()!.split(separator: " ").map { Int($0)! }
let arr = [Int](1...8)

switch r {
case arr :
    print("ascending")
case arr.reversed():
    print("descending")
default:
    print("mixed")
}
