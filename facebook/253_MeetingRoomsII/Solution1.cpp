#include <iostream>
#include <vector>
#include <string>
#include <unordered_map>
#include <map>
using namespace std;

struct Interval {
    int start;
    int end;
    Interval() : start(0), end(0) {}
    Interval(int s, int e) : start(s), end(e) {}
};

class Solution {
public:
    int minMeetingRooms(vector<Interval>& intervals) {
        map<int, int> m;
        for (auto a : intervals) {
            ++m[a.start];
            cout << "a.start:" << a.start << ", " << "m[a.start]:" << m[a.start] <<endl; 
            --m[a.end];
            cout << "a.end:" << a.end << ", " << "m[a.end]:" << m[a.end] <<endl; 
        }

        for(std::map<int, int>::iterator it = m.begin(); it != m.end(); it++) {
            cout << "key:" << it->first << ", " << "value:" << it->second<<endl;            
        } 

        int rooms = 0, res = 0;
        for (auto it : m) {
            cout << "key:===>" << it.first << ", " << "value:===>" << it.second<<endl;                      
            rooms += it.second;
            res = max(res, rooms);
            cout << "res:" << res << endl;
            cout << "rooms:" << rooms << endl;                        
        }
        cout << "res:" << res << endl;
        return res;
    }

};

int main(){
   Solution solution;
   struct Interval iterval1 = {9, 10};
   struct Interval iterval2 = {4, 9};
   struct Interval iterval3 = {9, 17};
   Interval list[3] = {iterval1, iterval2, iterval3};
   std::vector<Interval> v(list, list + sizeof list / sizeof(list[0]));
   // solution.maxSubArrayLen_1(v, 3);
   solution.minMeetingRooms(v);
}
