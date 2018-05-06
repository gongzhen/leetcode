public class LC165 {

    public int compareVersion(String version1, String version2) {
        String[] array1 = version1.split("\\.");
        String[] array2 = version2.split("\\.");

        int[] nums1 = new int[array1.length];
        int[] nums2 = new int[array2.length];

        for(int i = 0; i < nums1.length; i++) {
            nums1[i] = Integer.parseInt(array1[i]);
        }

        for(int i = 0; i < nums2.length; i++) {
            nums2[i] = Integer.parseInt(array2[i]);
        }

        int len = nums1.length > nums2.length ? nums2.length : nums1.length;

        int i = 0;
        while(i < len) {
            if(nums1[i] == nums2[i]) {
                i++;
            } else if (nums1[i] > nums2[i]) {
                return 1;
            } else {
                return -1;
            }
        }

        if(i == nums1.length && i == nums2.length) {
            return 0;
        } else if (i >= nums1.length && i < nums2.length) {
            return -1;
        }
        return 1;
    }

    public static void main(String[] args) {
        LC165 obj = new LC165();
        PrintUtils.printString("res:" + obj.compareVersion("0.1", "1.1"));
    }
}
