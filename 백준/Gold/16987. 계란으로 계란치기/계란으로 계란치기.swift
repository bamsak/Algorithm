let n = Int(readLine()!)!
var eggs = [(s: Int, w: Int)]()

for _ in 0..<n {
    let sw = readLine()!.split(separator: " ").map { Int($0)! }
    eggs.append((sw[0], sw[1]))
}

var result = 0

func dfs(_ depth: Int, _ count: Int) {
    result = max(result, count)
   
    if depth == n { return }
    
    if eggs[depth].s < 1 {
        dfs(depth + 1, count)
        return
    }
    
    for i in 0..<n where i != depth && eggs[i].s > 0 {
        eggs[depth].s -= eggs[i].w
        eggs[i].s -= eggs[depth].w
        
        let sum = (eggs[i].s < 1 ? 1 : 0 ) + (eggs[depth].s < 1 ? 1 : 0)
        dfs(depth + 1, count + sum)
        
        eggs[depth].s += eggs[i].w
        eggs[i].s += eggs[depth].w
    }
}

dfs(0, 0)
print(result)
