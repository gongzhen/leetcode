#include <iostream>
#include <vector>
#include <string>
#include <unordered_map>
using namespace std;

class Solution {
public:
    int maxSubArrayLen(vector<int>& nums, int k) {
        if (nums.empty()) return 0;
        int res = 0;
        unordered_map<int, vector<int>> m;
        m[nums[0]].push_back(0);
        vector<int> sum = nums;
        for (int i = 1; i < nums.size(); ++i) {
            sum[i] += sum[i - 1];
            m[sum[i]].push_back(i);
        }

        for(auto it = m.begin(); it != m.end(); ++it) {
            std::cout<<"key:" <<it->first << " [";
            vector<int> vect = it->second;
            for(vector<int>::iterator vt = vect.begin(); vt != vect.end(); ++vt) {
                std::cout<< *vt <<", ";
            }
            std::cout<<"]" <<std::endl;
        }

        for (auto it : m) {
            if (it.first == k) {
                std::cout<< "it.first: " << it.first << ", it.second:" << (it.second.back() + 1) << std::endl;
                res = max(res, it.second.back() + 1);
            }
            else if (m.find(it.first - k) != m.end()) {
                std::cout<<"it.second:" << (it.second.back()) << ", " << "it.first - k:" << m[it.first - k][0] << std::endl;
                res = max(res, it.second.back() - m[it.first - k][0]);
            }
        }
        return res;
    }

    int maxSubArrayLen_1(vector<int>& nums, int k) {
        int sum = 0, res = 0;
        unordered_map<int, int> m;
        for (int i = 0; i < nums.size(); ++i) {
            sum += nums[i];
            std::cout<<"sum:" <<sum << std::endl;
            if (sum == k){ 
                res = i + 1;
            } else if (m.count(sum - k)) {
                res = max(res, i - m[sum - k]);
                std::cout<<"sum - k:" << (sum - k) << ", res:" << res << std::endl;
            }
            if (!m.count(sum)) {
                m[sum] = i;
                std::cout<<"m[" << sum << "] == " << i << std::endl;   
            }            
        }
        std::cout<<"res:" << res << std::endl;   
        return res;
    }    
};

int main(){
   Solution solution;
   // int list[5] = {1, -1, 5, -2, 3};
   // int list[7] = {1, -1, 5, -2, 3, -3, 3};
   int list[3] = {1, 0, -1};
   std::vector<int> v(list, list + sizeof list / sizeof(list[0]));
   // solution.maxSubArrayLen_1(v, 3);
   solution.maxSubArrayLen_1(v, -1);
}
