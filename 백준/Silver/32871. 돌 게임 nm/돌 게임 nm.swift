for _ in 0..<Int(readLine()!)! {
  let nm = readLine()!.split(separator: " ").map { Int($0)! }
  let (n, m) = (nm[0], nm[1])
  
    if min(n, m) == 1 {
        print("YES")          
    } else if (n % 2) == (m % 2) {
        print("NO")
    } else {
        print("YES")
    }
}