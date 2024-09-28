for _ in 0..<Int(readLine()!)! {
    var dict = [String: [String]]()

    for _ in 0..<Int(readLine()!)! {
        let ab = readLine()!.split(separator: " ").map { String($0) }
        let (a, b) = (ab[0], ab[1])

        guard dict[b] == nil
        else {
            dict[b]!.append(a)
            continue
        }
        dict[b] = [a]
    }

    var result = dict.values.reduce(1) { $0 * ($1.count + 1) }
    print(result - 1)
}