//
//  CppStudy.cpp
//  LeetCode
//
//  Created by Admin on 2022/7/12.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"


//函数重载
//c++ 底层对函数名进行改编 修饰
//重载时会生成多个不同的函数名 不同编译器有不同的生成规则
void sum(int v1, double v2){
    cout << "int v1, double v2" << endl;
}

void sum(double v1, int v2){
    cout << "double v1, int v2" << endl;
}

//默认参数
//只能从右到左的顺序
int sum1(int v1 = 10, int v2 = 6){
    return v1 + v2;
}

//函数同时有声明和实现 只能放在声明中
int sum2(int v1 = 1, int v2 = 2);
int sum2(int v1, int v2){
    return v2 + v1;
}


//内联函数
//适合代码体积不大,频繁调用的函数
//编译器会将函数调用直接展开为函数体代码,可以减少函数调用的开销,会增大代码体积
inline int sun3(int v1, int v2){
    return v1 + v2;
}


struct Date {
    int year;
    int month;
    int day;
};

void test(){
    cout << "Hello, World!!\n";
    cout << "World";
    cout << endl;
    
//    string name;
//    cin >> name;
//    cout << "Hello " << name;

    sum(10, 10.5);
    sum(10.5,10);
    
    cout << sum1() << endl;
    cout << sum1(11) << endl;
    cout << sum1(10,20) << endl;

    Date d1 = {2022, 7, 5};
    
    Date *p = &d1;
    p -> year = 2015;
    
    cout << d1.year << endl;
    
    int age = 10;
    
    //const修饰的是右边的内容
    //p1不是常量 *p1是常量
    const int *p1 = &age;
    //p2不是常量 *p2是常量
    int const *p2 = &age;
    //p3是常量 *p1不是常量
    int * const p3 = &age;
    //p4是常量, *p4 也是常量
    const int * const p4 = &age;
    //p4是常量, *p4 也是常量
    int const * const p5 = &age;
    
    //引用 reference
    int age1 = 10;
    //定义age的引用 refAge相当于age的别名
    int &refAge = age1;
    refAge = 20;
    
    cout << age1 << endl;
    
    cout << endl;
}

