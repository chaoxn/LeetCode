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
    
    string s = "abcde";
    int cur = -1;
    bool ok = true;
    for (char c : "acd") {
        // 查找 cur 之后是否出现了 c
        cur = s.find(c, cur + 1);
        if (cur == string::npos) {
            ok = false;
            break;
        }
    }
    
}

int STL::countStudents(vector<int>& students, vector<int>& sandwiches) {
    int idx_sand = 0, idx_stu = 0; // 三明治的下标和学生的下标

    int n = students.size();
    
    while (idx_stu < n) { // 测试一下 vector 的 size 会不会动态更新
        //cout << students.size() << endl;
        if (students[idx_stu] != sandwiches[idx_sand]) {
            students.push_back(students[idx_stu]);
            idx_stu ++;
        } else {
            sandwiches[idx_sand] = -1; // 当前三明治已经被吃了
            idx_sand ++;
            idx_stu ++;
            n = students.size();
        }
    }
    
    int res = 0;
    
    for (int i = 0; i < sandwiches.size(); i ++) if (sandwiches[i] != -1) res ++;
    
    return res;
}

bool STL::isSubseq(string s, string sub){
      
    int i = 0;
    int j = 0;
    
    while (j <= sub.length()) {
        if (i == s.length()-1) {
            break;
        }
        if (s[i] == sub[j]) {
            j++;
        }else{
            i++;
        }
       
    }
    
    if (j == sub.length()) {
        return true;
    }

    return false;
}
    
void split(const std::string& s, std::vector<std::string>& tokens, char delim = ' ') {
    tokens.clear();
    auto string_find_first_not = [s, delim](size_t pos = 0) -> size_t {
        for (size_t i = pos; i < s.size(); i++) {
            if (s[i] != delim) return i;
        }
        return std::string::npos;
    };
    size_t lastPos = string_find_first_not(0);
    size_t pos = s.find(delim, lastPos);
    while (lastPos != std::string::npos) {
        tokens.emplace_back(s.substr(lastPos, pos - lastPos));
        lastPos = string_find_first_not(pos);
        pos = s.find(delim, lastPos);
    }
}

bool STL::isCircularSentence(string sentence) {
        
    vector<string> vec;
    split(sentence, vec);
    char pre;
    char la;
    char first = vec[0][0];
    string lastStr = vec[vec.size()-1];
    char last = lastStr[lastStr.length()-1];
    
    if (first != last) {
        return false;
    }
    
    for (int i = 0; i < vec.size(); i++) {
        string str = vec[i];
        
        if (i > 0) {
            la = vec[i-1][vec[i-1].length()];
            pre = str[0];
            if (pre != la) {
                return false;
            }
        }
    }
    
    return true;
}
    
long long STL::dividePlayers(vector<int>& skill) {
    
    long long res = 0;
    
    sort(skill.begin(), skill.end());
    
    vector<vector<int>> vec;
    
    int i = 0;
    int j = skill.size() - 1;
    int temp = skill[i] + skill[j];
    
    while (i <= j) {
        
        if (skill[i] + skill[j] != temp) {
            return -1;
        }
        
        vec.push_back({skill[i], skill[j]});
        i++;
        j--;
    }
    
    for (auto v : vec){
        res += v[0] * v[1];
    }
    
    return res;
}
    
int minScore(int n, vector<vector<int>>& roads) {
    int res;
    
    
    
    
    
    return res;
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
