
for _ in 0..<Int(readLine()!)! {
    let s = readLine()!
    var o = 0
    var result = 0
    
    for i in s {
        if i == "O" {
            o += 1
            result += o
        } else {
            o = 0
        }
    }
    
    print(result)
}
