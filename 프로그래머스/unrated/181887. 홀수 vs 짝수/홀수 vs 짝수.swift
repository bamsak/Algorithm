import Foundation

func solution(_ num_list:[Int]) -> Int {
    let odd = (0..<num_list.count).map{$0 % 2 == 0 ? num_list[$0] : 0}.reduce(0, +) 
    let even = (0..<num_list.count).map{$0 % 2 != 0 ? num_list[$0] : 0}.reduce(0, +) 
    return odd > even ? odd : even
}