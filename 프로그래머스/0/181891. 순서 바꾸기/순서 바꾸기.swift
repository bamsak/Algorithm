import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [Int] {
    var result = [Int]()
    
    (n..<num_list.count).forEach { result.append(num_list[$0]) }
    (0..<n).forEach { result.append(num_list[$0]) }
    
    return result
}