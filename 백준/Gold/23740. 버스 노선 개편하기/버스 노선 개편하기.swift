var routes = [(start: Int, end: Int, cost: Int)]()

for _ in 0..<Int(readLine()!)! {
    let sec = readLine()!.split(separator: " ").map { Int($0)! }
    routes.append((sec[0], sec[1], sec[2]))
}

routes.sort { $0.start < $1.start }

var result = [(start: Int, end: Int, cost: Int)]()

var temp = routes[0]

for route in routes[1...] {
    if temp.end >= route.start {
        temp = (temp.0, max(temp.end, route.end), min(temp.cost, route.cost) )
    } else {
        result.append(temp)
        temp = route
    }
}

if !result.contains(where: { $0 == temp }) {
    result.append(temp)
}

print(result.count)
result.forEach {
    print("\($0.start) \($0.end) \($0.cost)")
}