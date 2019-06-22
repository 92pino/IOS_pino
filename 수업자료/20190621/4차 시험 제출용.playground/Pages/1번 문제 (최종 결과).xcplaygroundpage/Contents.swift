/*:
 ---
 ## 1번 문제 (최종 결과)
 ---
 */
import Foundation

func game (N: Int) -> String {
    var winner = [0, 2].contains(N % 7) ? "창근" : "정아"
    
    return winner
}
game(N: 0)
game(N: 5)    // 승자 : 정아
game(N: 19)   // 승자 : 정아
game(N: 37)
game(N: 350)
