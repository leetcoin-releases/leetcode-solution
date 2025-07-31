class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        m,n=len(nums1),len(nums2)
        total=(m+n)
        half=(m+n)//2
        if(m>n):
         nums1,nums2=nums2,nums1
        l,r=0,len(nums1)-1
        while True:
            i=(l+r)//2 
            j=half-i-2 
            Al=nums1[i] if i>=0 else -1<<31
            Ar=nums1[i+1] if (i+1)<len(nums1) else 1<<31
            Bl=nums2[j] if j>=0 else -1<<31
            Br=nums2[j+1] if (j+1)<len(nums2) else 1<<31
            if(Al>Br):          
                r=i-1
            elif(Bl>Ar):
                l=i+1
            elif(Al<=Br or Ar<=Bl):
                if(total%2):
                    return float(min(Ar,Br))
                else:
                    return (max(Al,Bl)+min(Ar,Br))/2
                    