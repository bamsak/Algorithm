import Foundation

func solution(_ hp:Int) -> Int {
    // 장군 개미 5
    // 병정 개미 3
    // 일 개미 1
    var general: Int = 0
    var soldier: Int = 0
    var worker: Int = 0
    var result: Int = 0
    
    if hp % 5 != 0 {
        general = hp / 5
        soldier = hp % 5 / 3
        worker = hp % 5 % 3
        
        result = general + soldier + worker
    } else if hp % 5 == 0{
        return hp / 5
    }
    
    return result
}
