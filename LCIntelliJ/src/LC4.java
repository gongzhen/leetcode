public class LC4 {

    public double findMedianSortedArrays(int[] nums1, int[] nums2) {
        int len = nums1.length + nums2.length;
        if(len % 2 == 1) {
            partition(nums1, 0, nums1.length - 1, nums2, 0, nums2.length - 1, len / 2 + 1);
        }
        return (partition(nums1, 0, nums1.length - 1, nums2, 0, nums2.length - 1, len / 2)
                + partition(nums1, 0, nums1.length - 1, nums2, 0, nums2.length - 1, len / 2 + 1)) / 2.0;
    }

    private int partition(int[] nums1, int s1, int e1, int[] nums2, int s2, int e2, int k) {
        int i = s1;
        int j = s2;
        while( i <= e1 && j <= e2) {
            if(k == 1) {
                break;
            }

            int mid1 = i + k / 2 - 1 <= e1 ? nums1[i + k / 2 - 1] : Integer.MAX_VALUE;
            int mid2 = j + k / 2 - 1 <= e2 ? nums2[j + k / 2 - 1] : Integer.MAX_VALUE;
            if(mid1 < mid2) {
                i = i + k / 2;
            } else {
                j = j + k / 2;
            }
            k = k - k / 2;
        }

        if(i > e1) {
            return nums2[j + k - 1];
        }
        if(j > e2) {
            return nums1[i + k - 1];
        }
        return Math.min(nums1[i], nums2[j]);
    }

    public static void main(String[] args) {
//        int[] A1 = new int[] {1, 3};
//        int[] B1 = new int[] {2};
//        LC4 obj = new LC4();
//        PrintUtils.printString("res:" + obj.findMedianSortedArrays(A1, B1));

        int[] A1 = new int[] {1, 2, 3};
        int[] B1 = new int[] {4, 5, 6};
        LC4 obj = new LC4();
        PrintUtils.printString("res:" + obj.findMedianSortedArrays(A1, B1));
    }
}
