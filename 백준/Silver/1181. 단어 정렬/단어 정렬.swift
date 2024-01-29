var set = Set<String>()

for _ in 0..<Int(readLine()!)! {
    set.insert(readLine()!)
}
set.sorted { $0 < $1 }.sorted { $0.count < $1.count }.forEach { print($0) }
