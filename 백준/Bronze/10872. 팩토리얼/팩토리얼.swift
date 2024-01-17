let n = Int(readLine()!)!
if n != 0 {
    print((1...n).reduce(1, *))
} else {
    print(1)
}
