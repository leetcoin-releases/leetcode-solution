class Solution {
  List<String> removeInvalidParentheses(String s) {
    int rmL=0, rmR=0;
    for(int i=0;i<s.length;i++){
      if(s[i]=='(') rmL++;
      else if(s[i]==')'){ if(rmL>0) rmL--; else rmR++; }
    }
    var ans = <String>{};
    void dfs(int i, int rl, int rr, int open, String path){
      if(i==s.length){
        if(rl==0 && rr==0 && open==0) ans.add(path);
        return;
      }
      var c = s[i];
      if(c=='('){
        if(rl>0) dfs(i+1, rl-1, rr, open, path);
        dfs(i+1, rl, rr, open+1, path + c);
      } else if(c==')'){
        if(rr>0) dfs(i+1, rl, rr-1, open, path);
        if(open>0) dfs(i+1, rl, rr, open-1, path + c);
      } else {
        dfs(i+1, rl, rr, open, path + c);
      }
    }
    dfs(0, rmL, rmR, 0, "");
    var res = ans.toList();
    res.sort((a, b) => a.compareTo(b));
    return res;
  }
}
