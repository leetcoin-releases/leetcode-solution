object Solution {
    def longestCommonPrefix(strs: Array[String]): String = {
      if (strs.isEmpty) return ""
      var prefix = strs(0)
      for(i <- 1 until strs.length)
      {
        while(!strs(i).startsWith(prefix) && prefix.nonEmpty)
        {
          prefix = prefix.substring(0,prefix.length-1)
        }
      }
      prefix
    }
}