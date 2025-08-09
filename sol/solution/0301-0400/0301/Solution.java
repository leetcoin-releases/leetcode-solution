class Solution {
    private final Set<String> validExpressions = new LinkedHashSet<>();
    public List<String> removeInvalidParentheses(String s) {
        int extraOpen = 0;
        int extraClose = 0;
        for (char c : s.toCharArray()) {
            if (c == '(') {
                extraOpen++;
            }
            else if (c == ')') {
                if (extraOpen > 0) {
                    extraOpen--;
                }
                else {
                    extraClose++;
                }
            }
        }
        backtrack(s, 0, new char[s.length() - extraOpen - extraClose], 0, extraOpen, extraClose, 0);
        return new ArrayList<>(validExpressions);
    }
    private void backtrack(
            String s,
            int index,
            char[] curr,
            int currIndex,
            int openRem,
            int closeRem,
            int balance
    ) {
        if (openRem < 0 || closeRem < 0 || balance < 0) return;
        if (index == s.length()) {
            if (openRem == 0 && closeRem == 0) {
                validExpressions.add(new String(curr));
            }
            return;
        }
        char c = s.charAt(index);
        if (c == '(' && openRem > 0 && (currIndex == 0 || curr[currIndex - 1] != '(')) {
            backtrack(s, index + 1, curr, currIndex, openRem - 1, closeRem, balance);
        }
        if (c == ')' && closeRem > 0 && (currIndex == 0 || curr[currIndex - 1] != ')')) {
            backtrack(s, index + 1, curr, currIndex, openRem, closeRem - 1, balance);
        }
        if (currIndex < curr.length) {
            curr[currIndex] = c;
            int newBalance = balance;
            if (c == '(') {
                newBalance++;
            }
            else if (c == ')') {
                newBalance--;
            }
            backtrack(s, index + 1, curr, currIndex + 1, openRem, closeRem, newBalance);
        }
    }
}