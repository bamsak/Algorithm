var result = ""

for _ in 0..<Int(readLine()!)! {
    let rs = readLine()!.split(separator: " ")
    let (r, s) = (Int(rs[0])!, rs[1])
    
    for c in s {
        result.append(String(repeating: c, count: r))
    }
    result.append("\n")
}

print(result)
