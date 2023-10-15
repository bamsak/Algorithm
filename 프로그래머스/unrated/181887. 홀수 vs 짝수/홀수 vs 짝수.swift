import Foundation

func solution(_ num_list:[Int]) -> Int {
    let totalIndex = num_list.count - 1
    let odd = (0...totalIndex).map{$0 % 2 == 0 ? num_list[$0] : 0}.reduce(0, +) 
    let even = (0...totalIndex).map{$0 % 2 != 0 ? num_list[$0] : 0}.reduce(0, +) 
    return odd > even ? odd : even
}