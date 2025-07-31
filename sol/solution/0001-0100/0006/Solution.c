char* convert(char* s, int numRows) {
    int sLength = strlen(s);
    char *res = (char *)malloc((sLength + 1) * sizeof(char));
    res[sLength] = '\0';
    int resPos = 0;
    int i = 0;
    int gap = (numRows - 1) * 2;
    if(gap == 0) {
        gap = 1;
    }
    for(int j = 0; j < sLength; j+=gap) {
        res[resPos] = s[j];
        resPos++;
    }
    int gapLeft = gap;
    for(i=1; i<numRows-1; i++) {
        gapLeft-=2;
        int currGap = gap - gapLeft;
        for(int j = i; j < sLength; j+= currGap){
            res[resPos] = s[j];
            resPos++;
            currGap = gap - currGap;
        }
    }
    for(int j = i; j < sLength && numRows > 1; j+=gap) {
        res[resPos] = s[j];
        resPos++;
    }
    return res;
}