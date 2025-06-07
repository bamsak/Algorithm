var arr = [String]()

for _ in 0..<Int(readLine()!)! {
    arr.append(readLine()!)
}

let sortedArr = arr.sorted()
let reversedArr: [String] = sortedArr.reversed()

switch arr {
case sortedArr:
    print("INCREASING")
case reversedArr:
    print("DECREASING")
default:
    print("NEITHER")
}
