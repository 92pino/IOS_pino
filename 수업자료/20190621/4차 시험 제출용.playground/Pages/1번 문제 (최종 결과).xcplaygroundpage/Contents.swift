/*:
 ---
 ## 1번 문제 (최종 결과)
 ---
 */
import Foundation

func game (N: Int) -> String {
    var winner = N % 2 == 1 ? "정아" : "창근"
    
    return winner
}
game(N: 5)    // 승자 : 정아
game(N: 19)   // 승자 : 정아
game(N: 37)
game(N: 350)
