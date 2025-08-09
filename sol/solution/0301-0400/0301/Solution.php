class Solution {
    /**
     * @param String $s
     * @return String[]
     */
    function removeInvalidParentheses($s) {
        $result = [];
        $this->dfs($s, 0, 0, ['(', ')'], $result);
        return array_values($result);
    }
    function dfs($s, $start, $lastRemovedIndex, $parentheses, &$result) {
        $open = $parentheses[0];
        $close = $parentheses[1];
        $stack = 0;
        for ($i = $start; $i < strlen($s); $i++) {
            if ($s[$i] == $open) {
                $stack++;
            } elseif ($s[$i] == $close) {
                $stack--;
            }
            if ($stack < 0) {
                for ($j = $lastRemovedIndex; $j <= $i; $j++) {
                    if ($s[$j] == $close && ($j == $lastRemovedIndex || $s[$j - 1] != $close)) {
                        $this->dfs(substr($s, 0, $j) . substr($s, $j + 1), $i, $j, $parentheses, $result);
                    }
                }
                return;
            }
        }
        $reversed = strrev($s);
        if ($open == '(') {
            $this->dfs($reversed, 0, 0, [')', '('], $result);
        } else {
            $result[] = $reversed;
        }
    }
}