func solution(_ s:String) -> String {
    let nums = s.split(separator: " ").map { Int($0)! }
    return "\(nums.min()!) \(nums.max()!)"
}