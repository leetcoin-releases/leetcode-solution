public class Solution {
    public IList<string> RemoveInvalidParentheses(string s) {
        var stack = new Stack<int>();
        var resSet = new HashSet<string>();
        int closesRemoved = 0;
        resSet.Add(s);
        for(int i = 0; i < s.Length; i++) {
            if(s[i] == '(') {
                stack.Push(i);
                continue;
            } else if(s[i] == ')') {
                if(stack.Count == 0) {
                    RemoveClose(i-closesRemoved);
                    closesRemoved++;
                    continue;
                }
                stack.Pop();
            }
        }
        while(stack.Count > 0) {
            RemoveOpen(stack.Pop()-closesRemoved);
        }
        return resSet.ToList();
        void RemoveClose(int endIdx) {
            var newSet = new HashSet<string>();
            foreach(string s in resSet) {
                for(int i = endIdx; i >= 0; i--) {
                    if(s[i] == ')') {
                        newSet.Add(s.Remove(i,1));
                    }
                }
            }
            resSet = newSet;
        }
        void RemoveOpen(int startIdx) {
            var newSet = new HashSet<string>();
            foreach(string s in resSet) {
                for(int i = startIdx; i < s.Length; i++) {
                    if(s[i] == '(') {
                        newSet.Add(s.Remove(i,1));
                    }
                }
            }
            resSet = newSet;
        }
    }
}