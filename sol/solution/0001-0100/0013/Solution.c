int romanToInt(char * s){
    int map[128] = {0}; map['I'] = 1; map['V'] = 5; map['X'] = 10; map['L'] = 50; map['C'] = 100; map['D'] = 500; map['M'] = 1000;
    int res = 0;
    for (int i = 0; s[i]; i++) {
        if (s[i+1] && map[s[i]] < map[s[i+1]])
            res -= map[s[i]];
        else
            res += map[s[i]];
    }
    return res;
}