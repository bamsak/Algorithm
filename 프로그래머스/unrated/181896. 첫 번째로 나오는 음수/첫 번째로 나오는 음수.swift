import Foundation

func solution(_ num_list:[Int]) -> Int {
    return num_list.firstIndex(where:{$0 < 0}) ?? -1
}