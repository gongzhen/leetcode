class Solution:
    # @param {string} s
    # @return {integer}
    def calculate(self, s):
        signs = [1, 1]
        res = 0
        i = 0
        while i < len(s):
            x = s[i]
            
            if x.isdigit():
                start = i
                while i < len(s) and s[i].isdigit():
                    i += 1
                res += signs.pop() * int(s[start:i])
                print "line 16 %s => result: %d" % (signs, res)
                continue
            elif x in '(+':
                signs.append(signs[-1])
                print "line 19 %s" % signs
            elif x == '-':
                signs.append(signs[-1] * -1)
                print "line 22 %s" % signs
            elif x == ')':
                signs.pop()
                print "line 26 %s" % signs
            i += 1
        
        return res

a = Solution()
print(a.calculate("1-(2-3)"))