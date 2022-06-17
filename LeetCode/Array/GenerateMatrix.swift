//
//  GenerateMatrix.swift
//  LeetCode
//
//  Created by chaox on 2022/6/17.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

//59. 螺旋矩阵 II
/**
 给定一个正整数 n，生成一个包含 1 到 n^2 所有元素，且元素按顺时针顺序螺旋排列的正方形矩阵。

 输入: 3 输出: [ [ 1, 2, 3 ],
                [ 8, 9, 4 ],
                [ 7, 6, 5 ] ]
 #
 */
func generateMatrix(_ n: Int) -> [[Int]] {
        
    var matrix = Array.init(repeating: Array.init(repeating: -1, count: n), count: n)
    var top = 0
    var left = 0
    var right = n-1
    var bottom = n-1
    
    //需要填入矩阵的数字
    var num = 1
    
    while num <= n*n {
        
        if top <= bottom {
            for row in left...right{
                matrix[top][row] = num
                num += 1
            }
            top += 1
        }
        
        if left <= right && top <= bottom {
            for coloum in top...bottom{
                matrix[coloum][right] = num
                num += 1
            }
            right -= 1
        }
        
        if left <= right && top <= bottom {
            for row in (left...right).reversed(){
                matrix[bottom][row] = num
                num += 1
            }
            bottom -= 1
        }
        
        if left <= right && top <= bottom {
            for coloum in (top...bottom).reversed(){
                matrix[coloum][left] = num
                num += 1
            }
            left += 1
        }
    }
    
    return matrix
}

//54 螺旋矩阵
func spiralOrder_1(_ matrix: [[Int]]) -> [Int] {

    guard matrix.count != 0 else {
        return []
    }
    
    var res: [Int] = []
    //矩阵的长和宽
    let m = matrix.count  //宽
    let n = matrix[0].count //长
    
    //矩阵的四个边界
    var top = 0
    var bottom = m-1
    var left = 0
    var right = n-1
    
    //当结果集数量 = m * n 遍历结束
    while left <= right && top <= bottom {
        
        //上 -> 右 -> 下 -> 左
        // 第一步：top: 从左到右遍历 left -> right
        if left < right {
          for column in left...right {
              res.append(matrix[top][column])
            }
          top += 1
        }

        // 第二步：right: 从上到下遍历 top -> bottom
        if top < bottom {
            for row in top...bottom {
                res.append(matrix[row][right])
            }
            right -= 1
        }
        
        if left < right && top < bottom {
            // 第三步：bottom：从右到左遍历 right -> left
            for i in (left...right).reversed() {
                res.append(matrix[bottom][i])
            }
            bottom -= 1
        }
  
        // 第四步：left：从下到上遍历 bottom -> top
        if left < right && top < bottom {
            for i in (top...bottom).reversed() {
                res.append(matrix[i][left])
            }
            left += 1
        }
    }

    return res
}
