bool isValid(const char* s) {
    int opened = 0;
    for (int i = 0; s[i]; ++i) {
        if (s[i] == '(')
            ++opened;
        else if (s[i] == ')') {
            --opened;
            if (opened < 0)
                return false;
        }
    }
    return opened == 0;
}
void dfs(char* s, int start, int l, int r, char** results, int* returnSize) {
    if (l == 0 && r == 0 && isValid(s)) {
        results[*returnSize] = strdup(s);
        (*returnSize)++;
        return;
    }
    for (int i = start; s[i]; ++i) {
        if (i > start && s[i] == s[i - 1])
            continue;
        if (l > 0 && s[i] == '(') {
            char temp[128];
            strncpy(temp, s, i);
            strcpy(temp + i, s + i + 1);
            dfs(temp, i, l - 1, r, results, returnSize);
        } else if (r > 0 && s[i] == ')') {
            char temp[128];
            strncpy(temp, s, i);
            strcpy(temp + i, s + i + 1);
            dfs(temp, i, l, r - 1, results, returnSize);
        }
    }
}
void getLeftAndRightCounts(const char* s, int* l, int* r) {
    *l = 0;
    *r = 0;
    for (int i = 0; s[i]; ++i) {
        if (s[i] == '(') {
            (*l)++;
        } else if (s[i] == ')') {
            if (*l == 0)
                (*r)++;
            else
                (*l)--;
        }
    }
}
char** removeInvalidParentheses(char* s, int* returnSize) {
    *returnSize = 0;
    char** results = (char**)malloc(sizeof(char*) * 512);
    int l, r;
    getLeftAndRightCounts(s, &l, &r);
    dfs(s, 0, l, r, results, returnSize);
    return results;
}