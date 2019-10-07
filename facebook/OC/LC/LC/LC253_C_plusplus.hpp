//
//  LC253_C_plusplus.hpp
//  LC
//
//  Created by Zhen Gong on 9/27/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#ifndef LC253_C_plusplus_hpp
#define LC253_C_plusplus_hpp

#include <stdio.h>
#include <iostream>
#include <vector>
#include <map>
#include <algorithm>    // std::max
/// http://www.ecst.csuchico.edu/~trhenry/classes/211.s17/example_src/advanced/bitwise_enum.cpp
// https://stackoverflow.com/questions/19229574/calling-c-from-objective-c
// https://stackoverflow.com/questions/1061005/calling-objective-c-method-from-c-member-function

using namespace std;

class Solution {
    
public:
    int minMeetingRooms(vector<vector<int>>& intervals) {
        map<int, int> dict;
        int res = 0;
        int rooms = 0;
        for (auto a : intervals) {
            ++dict[a[0]];
            --dict[a[1]];
        }
        
        for (auto it : dict) {
            cout << "first:" << it.first << ", second:" << it.second << endl;
            res = max(res, rooms += it.second);
        }
        return res;
    }
        
};

//int main()
//{
//    Solution solution;
//    vector< vector<int> > intervals {
//        {0, 30},
//        {5, 10},
//        {15, 20}
//    };
////    vector< vector<int> > intervals(3, vector<int>(2));
////    int interval1[] = {0, 30};
////    int interval2[] = {5, 10};
////    int interval3[] = {15, 20};
////    intervals[0](interval1, interval1 + sizeof(interval1) / sizeof(int));
////    intervals[1](interval2, interval2 + sizeof(interval2) / sizeof(int));
////    intervals[2](interval3, interval3 + sizeof(interval3) / sizeof(int));
//
//    solution.minMeetingRooms(intervals);
//}

#endif /* LC253_C_plusplus_hpp */
