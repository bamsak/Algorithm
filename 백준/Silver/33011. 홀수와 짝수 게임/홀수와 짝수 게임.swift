for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    let even = nums.filter { $0 % 2 == 0 }.count
    let odd = n - even
    
    even == odd ? print("heeda0528") : max(even, odd) % 2 == 0 ? print("heeda0528") : print("amsminn")
}
