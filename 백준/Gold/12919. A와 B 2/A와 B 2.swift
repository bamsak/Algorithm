let s = readLine()!
let t = readLine()!
var result = 0

func dfs(_ str: String) {
    if str.count == s.count {
        if str == s {
            result = 1
        }
        return
    }
    
    if str.last! == "A" {
        var temp = str
        temp.removeLast()
        dfs(temp)
    }
    
    if str.first! == "B" {
        var temp = String(str.reversed())
        temp.removeLast()
        dfs(temp)
    }
    
}
dfs(t)

print(result)