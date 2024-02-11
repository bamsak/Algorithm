var arr = [Int]()
var result = ""
for _ in 0..<Int(readLine()!)! {
    arr.append(Int(readLine()!)!)
}
arr.sorted(by: >).forEach { result += "\($0)\n" }
print(result)
