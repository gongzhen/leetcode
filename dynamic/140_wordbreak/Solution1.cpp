#include <algorithm>
#include <iostream>
#include <vector>
#include <string>
using namespace std;

class Solution {
public:
    
    vector<vector<int> >dp;
    vector<string> vals;
    string val;

    vector<string> wordBreak(string s, vector<string>& wordDict) {
        int len = (int)s.size();
        dp.resize(len);
        for(int i = 0; i < len; i++) {
            dp[i].resize(len + 1, 0);
        }

        for(int i = 1; i <= len; i++) {
            for(int j = 0; j < len -i + 1; j++) {
                //直接存在于字典中，是第1种情况
                
                if(std::find(wordDict.begin(), wordDict.end(), s.substr(j, i)) != wordDict.end()) {
                    dp[j][i] = 1;
                    continue;
                }
                //如果不存在，则看子串是不是能被切分，这是第2中情况
                for(int k = 1; k < i && k < len -j; k++) {
                    if(dp[j][k] && dp[j + k][i - k]) {
                        dp[j][i] = 2;
                        break;
                    }
                }
            }
        }

        //不能切分，不用dfs了
        if(dp[0][len] == 0) {
            return vals;
        }
        printVectorOfVector(dp);
        dfs(s, 0);
        return vals;
    }

    void printVectorOfVector(vector< vector<int> >& v) {

        for(std::vector< vector<int> >::iterator it = v.begin(); it != v.end(); ++it) {
           for(std::vector<int>::iterator itOfit = (*it).begin(); itOfit != (*it).end(); ++itOfit) {
                std::cout << ' ' << *itOfit;
            } 
            std::cout<< endl;
        } 
    }

    void dfs(const string& s, int start) {
        int len = (int)s.size();
        if(start == len) {
            vals.push_back(val);
            return;
        }

        for(int i = 1; i <= len - start;i++) {
            if(dp[start][i] == 1) {
                int oldLen = (int)val.size();
                if(oldLen != 0) {
                    val.append(" ");
                }
                val.append(s.substr(start, i));

                //我们从start + i开始继续dfs
                dfs(s, start + i);
                val.erase(oldLen, string::npos);
            }
        }
    } 


};

int main(){
    Solution solution;
    std:string s1 ("catsanddog");
    vector<string> list;
    list.push_back("cat");
    list.push_back("cats");
    list.push_back("and");
    list.push_back("sand");
    list.push_back("dog");
    solution.wordBreak(s1, list);
}