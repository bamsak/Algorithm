for _ in 0..<Int(readLine()!)! {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    if abs(nums[1] - nums[3]) > 3 {
        print("KIN")
    } else {
        print(nums[1...3].reduce(0, +))
    }
}
