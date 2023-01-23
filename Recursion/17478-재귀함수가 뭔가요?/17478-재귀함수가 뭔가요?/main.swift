//
//  main.swift
//  17478-재귀함수가 뭔가요?
//
//  Created by 강민수 on 2023/01/18.
//

import Foundation

let firstParagraph = "어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다."
let secondParagraph = #""재귀함수가 뭔가요?""#
let thirdParagraph = #""잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어."#
let fourthParagraph = "마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지."
let fifthParagraph = #"그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.""#

let firstAnswer = #""재귀함수는 자기 자신을 호출하는 함수라네""#
let secondAnswer = "라고 답변하였지."
let underBar = "____"

func printSentence(n: Int, sentence: String) {
    for _ in 0..<n {
        print(underBar, terminator: "")
    }
    print(sentence)
}

func printRecursion(number: Int = 0, target: Int) {
    
    if number != target {
        printSentence(n: number, sentence: secondParagraph)
        printSentence(n: number, sentence: thirdParagraph)
        printSentence(n: number, sentence: fourthParagraph)
        printSentence(n: number, sentence: fifthParagraph)
    } else {
        printSentence(n: number, sentence: secondParagraph)
        printSentence(n: number, sentence: firstAnswer)
        printSentence(n: number, sentence: secondAnswer)
        
        return
    }
    
    printRecursion(number: number+1, target: target)
    
    printSentence(n: number, sentence: secondAnswer)
    
}

let n = Int(readLine()!)!

print(firstParagraph)
printRecursion(target: n)
