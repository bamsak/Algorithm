func solution(_ arr:[Int]) -> [Int] {
    let min = arr.min()!
    let result = arr.filter { $0 != min }
    return result.isEmpty ? [-1] : result
}