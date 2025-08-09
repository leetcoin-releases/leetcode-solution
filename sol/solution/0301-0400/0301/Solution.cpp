class Solution {
public:
    vector<string> removeInvalidParentheses(string s) {
        vector<string> res;
        unordered_set<string> visited;
        queue<string> q;
        visited.insert(s);
        q.push(s);
        while (!q.empty()) {
            size_t sz = q.size();
            unordered_set<string> levelRes;
            for (size_t i = 0; i < sz; ++i) {
                string cur = q.front();
                q.pop();
                if (isValid(cur)) {
                    levelRes.insert(cur);
                }
                if (levelRes.empty()) {
                    for (size_t j = 0; j < cur.size(); ++j) {
                        if (cur[j] != '(' && cur[j] != ')') continue;
                        if (j > 0 && cur[j] == cur[j - 1]) continue;
                        string next = cur.substr(0, j) + cur.substr(j + 1);
                        if (visited.insert(next).second) q.push(next);
                    }
                }
            }
            if (!levelRes.empty()) {
                res.assign(levelRes.begin(), levelRes.end());
                break;
            }
        }
        if (res.empty() && isValid(s)) res.push_back(s);
        return res;
    }
private:
    bool isValid(const string& str) {
        int bal = 0;
        for (char c : str) {
            if (c == '(') ++bal;
            else if (c == ')') {
                if (--bal < 0) return false;
            }
        }
        return bal == 0;
    }
};