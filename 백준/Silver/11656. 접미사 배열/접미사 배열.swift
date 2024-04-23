let s = readLine()!.map { String($0) }
var arr = [String]()
var temp = ""
for str in s.reversed() {
    temp += str
    let new = temp.reversed()
    arr.append(String(new))
}

arr.sorted().forEach{ print($0) }