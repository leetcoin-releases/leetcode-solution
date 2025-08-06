char* intToRoman(int num) {
    static char res[20];
    int val[] = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
    char* sy[] = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};
    int i = 0, p = 0;
    while (num) {
        while (num >= val[i]) {
            for (char* s = sy[i]; *s; s++) res[p++] = *s;
            num -= val[i];
        }
        i++;
    }
    res[p] = 0;
    return res;
}