class Solution {
  String longestCommonPrefix(List<String> strs) {
    if (strs.isEmpty) return "";
    String prefix = strs[0];
    for (var str in strs.skip(1)) {
      while (!str.startsWith(prefix)) {
        prefix = prefix.substring(0, prefix.length - 1);
        if (prefix.isEmpty) return "";
      }
    }
    return prefix;
  }
}