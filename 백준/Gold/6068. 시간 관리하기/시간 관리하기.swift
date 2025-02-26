var task = [(t: Int, s: Int)]()
for _ in 0..<Int(readLine()!)! {
    let ts = readLine()!.split(separator: " ").map { Int($0)! }
    let (t, s) = (ts[0], ts[1])
    task.append((t, s))
}

task.sort { $0.s > $1.s }
var result = task.first!.s

for i in 0..<task.count {
    if result >= task[i].s {
        result = task[i].s - task[i].t
    } else {
        result -= task[i].t
    }
}

print(result < 0 ? -1 : result)

