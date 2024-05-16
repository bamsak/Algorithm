for _ in 0..<Int(readLine()!)! {
    var result = 0
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let students = Array(input[1...])
    for i in 0..<students.count {
        for j in i..<students.count {
            if students[i] > students[j] {
                result += 1
            }
        }
    }
    print("\(input[0]) \(result)")
}