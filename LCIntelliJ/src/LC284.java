import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class LC284 {

    private static class PeekingIterator implements Iterator<Integer> {
        private final Iterator<Integer> iterator;
        private boolean hasPeeked;
        private Integer peekedElement;


        public PeekingIterator(Iterator<Integer> iterator) {
            // initialize any member here.
            this.iterator = iterator;
        }

        // Returns the next element in the iteration without advancing the iterator.
        public Integer peek() {
            if (!hasPeeked) {
                peekedElement = iterator.next();
                hasPeeked = true;
            }
            return peekedElement;
        }

        // hasNext() and next() should behave the same as in the Iterator interface.
        // Override them if needed.
        @Override
        public Integer next() {
            if (!hasPeeked) {
                return iterator.next();
            }
            Integer result = peekedElement;
            hasPeeked = false;
            peekedElement = null;
            return result;
        }

        @Override
        public boolean hasNext() {
            return hasPeeked || iterator.hasNext();
        }


    }

    public static void main(String[] args) {
        Integer[] nums = new Integer[]{1, 2, 3, 4};
        List<Integer> list = Arrays.asList(nums);

        /// Operations: [0,1,1,2,2,1,1,2,0,1,0,2,0]
        /// ["true","1","1","1","2","3","3","3","true","4","true","4","false"]

    }
}
