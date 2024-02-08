var abc = [Int]()
var arr = [Int](repeating: 0, count: 10)
for _ in 0..<3 {
    abc.append(Int(readLine()!)!)
}
String(abc.reduce(1, *)).forEach {
    arr[Int(String($0))!] += 1
}

arr.forEach {
    print($0)
}