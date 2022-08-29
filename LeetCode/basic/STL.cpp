//
//  STL.cpp
//  LeetCode
//
//  Created by Admin on 2022/7/12.
//  Copyright © 2022 ios. All rights reserved.
//

#include "STL.hpp"
#include "Header.h"

void STL::Array(){
    
    cout << "-------- array begin ---------" << endl;
    
    //array
    double balance[10];
    double balance1[5] = {1000.0, 2.0, 3.4, 7.0, 50.0};
    array<double, 4> a1;

    

}



void STL::Vector(){
    
    cout << "--------- vector begin ---------" << endl;

    //vector
    vector<int> nums = {1,2,3,4,5,9,8,7};
    int n = 8;
    
    vector<int> res;
    vector<int> array1;
    vector<int> array2;
    
    //截成两半
    vector<int>::const_iterator first = nums.begin();
    vector<int>::const_iterator second = nums.begin() + n/2;
    
    array1.assign(first, second);
    
    vector<int>::const_iterator first1 = nums.begin() + n/2;
    vector<int>::const_iterator second1 = nums.end();
    array2.assign(first1, second1);
    
    int i = 0;
    
    while (i < n/2) {
        res.push_back(array1[i]);
        res.push_back(array1[2]);
    }
    
    ///构造函数
    vector<int> a;
    vector<int> b(10);
    vector<int> c(10, 1);
    vector<int> d(b);

    b[0] = 1;
    b[1] = 2;
    b[3] = 3;
    
    ///增加函数
    
    a.push_back(12);
    //:向量中迭代器指向元素前增加一个元素x
//        a.insert(10, 12);
    
    //删除函数
    a.insert(a.begin(), 1);
    a.erase(a.begin()+2);  //删除指定元素
    a.pop_back(); //删除最后一个
    a.clear();    //清空元素
    
//    vector<int> nums = {0,0,1,1,1,2,2,3,3,4};
//    int slow = 0;
//    int fast = 0;
//
//    while (fast < nums.size() - 1) {
//        if (nums[fast] != nums[fast + 1]) {
//            nums[fast] = nums[fast+1];
//            slow += 1;
//        }
//        fast += 1;
//    }
    
    
}

void STL::practise(){
    //c++ primer 第四章练习题
    
    //1.
    char actor[30];
    short betsie[100];
    float chuck[13];
    long double dipsea[64];
    
    //2.
    array<char, 30> actor1;
    array<short, 100> betsiz1;
    array<float, 13> chuck1;
    array<long double, 64> dipsea1;
    
    //3.声明一个包含5个元素的int数组，并将它初始化为前5个正奇数。
    array<int, 5> array1;
    array1[0] = 1;
    array1[1] = 3;
    array1[2] = 5;
    array1[3] = 7;
    array1[4] = 9;
    
//    int array1[5] = {1,3,5,7,8};
    
    //4．编写一条语句，将问题3中数组第一个元素和最后一个元素的和 赋给变量even。
    int even = array1.front() + array1.back();
    cout << even << endl;
    
    //5．编写一条语句，显示float数组ideas中的第2个元素的值。
    array<float, 5> ideas;
    cout << ideas[1] << endl;
    
    //6．声明一个char的数组，并将其初始化为字符串“cheeseburger”。
    char lunch[13] = "cheeseburger";
    
    //7．声明一个string对象，并将其初始化为字符串“Waldorf Salad”。
    string str = "Waldorf Salad";
    
    //8．设计一个描述鱼的结构声明。结构中应当包括品种、重量（整 数，单位为盎司）和长度（英寸，包括小数）。
    struct fish {
        char kind[20];
        int weigth;
        float lenght;
    };
    
    //9．声明一个问题8中定义的结构的变量，并对它进行初始化。
    fish pet = {"hoho",10,1.2};
    
    //10．用enum定义一个名为Response的类型，它包含Yes、No和 Maybe等枚举量，其中Yes的值为1，No为0，Maybe为2。
    enum Response{
        No,
        Yes,
        Maybe
    };
    
    //11．假设ted是一个double变量，请声明一个指向ted的指针，并使用该指针来显示ted的值。
    double ted = 2;
    double *p1 = &ted;
    cout << *p1 << endl;
    
    //12．假设treacle是一个包含10个元素的float数组，请声明一个指向treacle的第一个元素的指针，并使用该指针来显示数组的第一个元素和最后一个元素。
    array<float, 10> treacle;
    float *p2 = &treacle[0];
    cout << *p2 << *(p2+9) << endl;
    
    //13．编写一段代码，要求用户输入一个正整数，然后创建一个动态的int数组，其中包含的元素数目等于用户输入的值。首先使用new来完 成这项任务，再使用vector对象来完成这项任务。
    
    unsigned int size;
    cout << "输入一个正整数:";
    cin >> size;
    int *sizeArray = new int[size];
    vector<int> sizeArray1(size);

}
