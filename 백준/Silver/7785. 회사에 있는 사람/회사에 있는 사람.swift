var s = Set<String>()

for _ in 0..<Int(readLine()!)! {
    let ab = readLine()!.split(separator: " ").map { String($0) }
    if ab[1] == "enter" {
        s.insert(ab[0])
    } else {
        s.remove(ab[0])
    }
}
s.sorted(by: >).forEach { print($0) }