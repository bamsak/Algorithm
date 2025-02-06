var array = [(t: Int, s: Int)]()

for _ in 0..<Int(readLine()!)! {
    let ts = readLine()!.split(separator: " ").map { Int($0)! }
    array.append((ts[0], ts[1]))
}

array.sort {
    if $0.s == $1.s {
        return $0.t < $1.t
    }
    return $0.s < $1.s
}

var result = array.last!.s

for now in array.reversed() {
    result = min(result, now.s) - now.t
}

result < 0 ? print("-1") : print(result)
