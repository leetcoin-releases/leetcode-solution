class Solution:
    def removeInvalidParentheses(self, s: str) -> List[str]:
        def remove(s, start_i, last_removal_j, par):
            count = 0
            for i in range(start_i, len(s)):
                if s[i] == par[0]: count += 1
                if s[i] == par[1]: count -= 1
                if count >= 0:
                    continue
                for j in range(last_removal_j, i+1):
                    if s[j] == par[1] and (j == last_removal_j or s[j-1] != par[1]):
                        remove(s[:j] + s[j+1:], i, j, par)
                return 
            reversed_s = s[::-1]
            if par[0] == '(':
                remove(reversed_s, 0, 0, [')', '('])
            else:
                result.append(reversed_s)
        result = []
        remove(s, 0, 0, ['(', ')'])
        return result
    def removeInvalidParenthesesBFS(self, s: str) -> List[str]:
        def is_valid(s: str) -> bool:
            cnt = 0
            for ch in s:
                if ch == '(':
                    cnt += 1
                elif ch == ')':
                    cnt -= 1
                    if cnt < 0:
                        return False
            return cnt == 0
        visited = set()
        dq = deque([s])
        found = False
        res = []
        while dq:
            cur = dq.popleft()
            if is_valid(cur):
                res.append(cur)
                found = True
            if found:
                continue
            for i in range(len(cur)):
                if cur[i] not in '()':
                    continue
                next_s = cur[:i] + cur[i + 1:]
                if next_s not in visited:
                    visited.add(next_s)
                    dq.append(next_s)
        return res if res else [""]
        