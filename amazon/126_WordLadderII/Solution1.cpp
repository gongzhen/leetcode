// string constructor
#include <iostream>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <list>
#include <queue> 

using namespace std;

class Solution {
public:
    vector<vector<string>> findLadders(string beginWord, string endWord, vector<string>& wordList) {
        
        unordered_set<string> dict(wordList.begin(), wordList.end());        
        if (!dict.count(endWord)) return {};
        dict.erase(beginWord);
        dict.erase(endWord);
        
        unordered_map<string, int> steps{{beginWord, 1}};
        unordered_map<string, vector<string>> parents;
        queue<string> q;
        q.push(beginWord);
        
        vector<vector<string>> ans;
        
        const int l = beginWord.length();
        int step = 0;        
        bool found = false;
        
        while (!q.empty() && !found) {
            ++step;   
            int size = q.size();         
            for (int k = size; k > 0; k--) {
                const string p = q.front(); q.pop();
                string w = p;
                for (int i = 0; i < l; i++) {
                    const char ch = w[i];
                    for (int j = 'a'; j <= 'z'; j++) {
                        if (j == ch) continue;
                        w[i] = j;
                        if (w == endWord) {
                            parents[w].push_back(p);
                            found = true;
                        } else {
                            // Not a new word, but another transform
                            // with the same number of steps
                            if (steps.count(w) && step < steps.at(w))
                                parents[w].push_back(p);
                        }
                        
                        if (!dict.count(w)) continue;
                        dict.erase(w);
                        q.push(w);
                        steps[w] = steps.at(p) + 1;
                        parents[w].push_back(p);
                    }
                    w[i] = ch;
                }
            }
        }
        
        if (found) {
            vector<string> curr{endWord};
            getPaths(endWord, beginWord, parents, curr, ans);
        }
    
        return ans;
    }
private:
    void getPaths(const string& word, 
                  const string& beginWord, 
                  const unordered_map<string, vector<string>>& parents,
                  vector<string>& curr,
                  vector<vector<string>>& ans) {        
        
        if (word == beginWord) {
            ans.push_back(vector<string>(curr.rbegin(), curr.rend()));
            return;
        }
        
        for (const string& p : parents.at(word)) {
            curr.push_back(p);
            getPaths(p, beginWord, parents, curr, ans);
            curr.pop_back();
        }        
    }
};

int main() {

    Solution obj;
    string start ("hit");
    string end ("cog");
    vector<string> list;
    string listArray[5] = {"hot","dot","dog","lot","log"};
    for(unsigned int a = 0; a < 5; a++) {
        list.push_back(listArray[a]);
    }
    for(vector<string>::iterator it = list.begin(); it != list.end(); ++it) {
        cout << *it << ", ";
    }
    cout << "\n";

    vector<vector<string>> res = obj.findLadders(start, end, list);
    for(unsigned int i = 0; i < res.size(); i++) {
        vector<string> subList = res[i];
        for(unsigned int j = 0; j < subList.size(); j++) {
            cout << subList[j] << ",";
        }
        cout << "\n";
    }
    return 0;
}