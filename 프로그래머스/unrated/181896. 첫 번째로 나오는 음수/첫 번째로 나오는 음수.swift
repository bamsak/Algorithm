import Foundation

func solution(_ num_list:[Int]) -> Int {
    return num_list.filter{$0 < 0}.count < 1 ? -1 : num_list.firstIndex(where:{$0 < 0})!
}