let np = readLine()!.split(separator: " ").map { Int($0)! }
let (n, p) = (np[0], np[1])
var stack = Array(repeating: Array(repeating: 0, count: 0), count: 7)
var count = 0

for _ in 0..<n {
    let lf = readLine()!.split(separator: " ").map { Int($0)! }
    let (line, fret) = (lf[0], lf[1])
    
    while true {
        guard let last = stack[line].last
        else {
            stack[line].append(fret)
            count += 1
            break
        }
        
        if last == fret {
            break
        }
                
        if last > fret {
            stack[line].removeLast()
        } else {
            stack[line].append(fret)
        }
        count += 1
    }
}

print(count)