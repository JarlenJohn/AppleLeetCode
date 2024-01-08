//
//  Number1.m
//  LetCode
//
//  Created by JarlenJohn on 2023/11/14.
//

#import "Number1_10.h"

@implementation Number1_10

- (NSArray *)twoSum:(NSArray <NSNumber *>*)nums target:(NSInteger)target {
    
    NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
    
    __block NSArray *result = nil;
    [nums enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber *num = mutDic[@(target - obj.integerValue)];
        if (num) {
            result = @[num, @(idx)];
            *stop = YES;
        }else {
            mutDic[obj] = @(idx);
        }
    }];
    return result;
}

- (ListNodeOC *)addTwoNumber:(ListNodeOC *)l1 listNode2:(ListNodeOC *)l2 {
    ListNodeOC *result = [[ListNodeOC alloc] initWithVal:0];
    ListNodeOC *currentNode = result;
    
    ListNodeOC *listNode1 = l1;
    ListNodeOC *listNode2 = l2;
    
    //进位标记
    NSInteger carry = 0;
    
    while (listNode1 || listNode2 || carry > 0) {
        NSInteger sum = listNode1.val + listNode2.val + carry;
        currentNode.next = [[ListNodeOC alloc] initWithVal:sum%10];
        currentNode = currentNode.next;
        
        listNode1 = listNode1.next;
        listNode2 = listNode2.next;
        carry = sum / 10;
    }
    
    return result.next;
}

/*
 * 滑动窗口法
 */
- (NSInteger)lengthOfLongestSubstring:(NSString *)s {
    if (s.length < 2) {
        return s.length;
    }
    
    NSInteger strLen = s.length;
    NSInteger maxLen = 0;
    NSInteger start = 0;
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    for (NSInteger i=0; i<strLen; i++) {
        unichar c = [s characterAtIndex:i];
        
        NSString *charStr = [NSString stringWithCharacters:&c length:1];
        NSNumber *idxNum = [map objectForKey:charStr];
        if (idxNum) {
            start = MAX(start, [idxNum integerValue] + 1);
        }
        
        map[charStr] = @(i);
        maxLen = MAX(maxLen, i-start+1);
    }
    
    return maxLen;
}

#pragma mark - 4

- (CGFloat)findMedianSortedArraysWithNums1:(NSArray *)num1 nums2: (NSArray *)num2 {
    
    NSInteger totalLength = num1.count + num2.count;
    if (totalLength % 2 != 0) {
        return [self getKthElement:num1 arr2:num2 kth:(totalLength+1)/2];
    }else {
        CGFloat result = ([self getKthElement:num1 arr2:num2 kth:(totalLength+1)/2] + [self getKthElement:num1 arr2:num2 kth:(totalLength+2)/2])/2.0;
        return result;
    }
}

/* 主要思路：要找到第 k (k>1) 小的元素，那么就取 pivot1 = nums1[k/2-1] 和 pivot2 = nums2[k/2-1] 进行比较
 * 这里的 "/" 表示整除
 * nums1 中小于等于 pivot1 的元素有 nums1[0 .. k/2-2] 共计 k/2-1 个
 * nums2 中小于等于 pivot2 的元素有 nums2[0 .. k/2-2] 共计 k/2-1 个
 * 取 pivot = min(pivot1, pivot2)，两个数组中小于等于 pivot 的元素共计不会超过 (k/2-1) + (k/2-1) <= k-2 个
 * 这样 pivot 本身最大也只能是第 k-1 小的元素
 * 如果 pivot = pivot1，那么 nums1[0 .. k/2-1] 都不可能是第 k 小的元素。把这些元素全部 "删除"，剩下的作为新的 nums1 数组
 * 如果 pivot = pivot2，那么 nums2[0 .. k/2-1] 都不可能是第 k 小的元素。把这些元素全部 "删除"，剩下的作为新的 nums2 数组
 * 由于我们 "删除" 了一些元素（这些元素都比第 k 小的元素要小），因此需要修改 k 的值，减去删除的数的个数
 */
- (NSInteger)getKthElement:(NSArray <NSNumber *>*)num1 arr2:(NSArray <NSNumber *>*)num2 kth:(NSInteger)k {
    NSInteger m = num1.count;
    NSInteger n = num2.count;
    
    NSInteger index1 = 0, index2 = 0;
    
    while (true) {
        
        //处理边界情况
        if (index1 == m) {
            NSNumber *num = num2[index2 + k - 1];
            return [num integerValue];
        }
        
        if (index2 == n) {
            NSNumber *num = num1[index1 + k - 1];
            return [num integerValue];
        }
        
        if (k == 1) {
            return MIN([num1[index1] integerValue], [num2[index2] integerValue]);
        }
        
        
        //正常情况
        NSInteger newIndex1 = MIN(index1+k/2-1, m-1);
        NSInteger newIndex2 = MIN(index2+k/2-1, n-1);
        NSInteger pivot1 = [num1[newIndex1] integerValue];
        NSInteger pivot2 = [num2[newIndex2] integerValue];
        
        if (pivot1 <= pivot2) {
            k -= newIndex1 - index1 + 1;
            index1 = newIndex1 + 1;
        }else {
            k -= newIndex2 - index2 + 1;
            index2 = newIndex2 + 1;
        }
    }
}



#pragma mark - 5

- (NSString *)longestPalindrome:(NSString *)s {
    NSInteger len = s.length;
    if (len < 2) {
        return s;
    }
    
    NSInteger maxLen = 1;
    NSInteger begin = 0;
    
    //将字符串转成字符数组
    NSMutableArray *charArr = [NSMutableArray array];
    for (NSInteger i=0; i<s.length; i++) {
        unichar character = [s characterAtIndex:i];
        [charArr addObject:[NSString stringWithFormat:@"%c", character]];
    }
    
    NSMutableArray *dp = [NSMutableArray arrayWithCapacity:len];
    for (NSInteger i=0; i<len; i++) {
        NSMutableArray *innerArr = [NSMutableArray arrayWithCapacity:len];
        for (NSInteger j=0; j<len; j++) {
            innerArr[j] = [NSNumber numberWithBool:NO];
        }
        dp[i] = innerArr;
    }
    
    for (NSInteger i=0; i<len; i++) {
        dp[i][i] = [NSNumber numberWithBool:YES];
    }
    
    for (NSInteger L = 2; L<=len; L++) {
        for (NSInteger i=0; i<len; i++) {
            //确定j的位置，根据j-i+1=L等式
            NSInteger j = L+i-1;
            
            // 如果右边界越界，就可以退出当前循环
            if (j>=len) {
                break;
            }
            
            if (![charArr[i] isEqualToString:charArr[j]]) {
                dp[i][j] = [NSNumber numberWithBool:NO];
            }else {
                if (j-i<3) {
                    dp[i][j] = [NSNumber numberWithBool:YES];
                }else {
                    dp[i][j] = dp[i+1][j-1];
                }
            }
            
            if ([dp[i][j] boolValue] && j-i+1>maxLen) {
                maxLen = j-i+1;
                begin = i;
            }
        }
    }
    
    return [s substringWithRange:NSMakeRange(begin, maxLen)];
}

#pragma mark - 6
//- (NSString *)convert:(NSString *)s numRows:(NSInteger)numRows {
//    if (!s) {
//        return nil;
//    }
//
//    NSInteger len = s.length;
//    //处理边界情况，若1 row or 1 column
//    if (numRows == 1 || len <= numRows) {
//        return s;
//    }
//
//
//    NSInteger t = 2*numRows - 2;//周期
//    NSInteger np = numRows - 1;//1个周期占用的矩阵列数
//    NSInteger c = ceil(len+t-1/t) * np;//总列数
//
//    //构造r行c列的矩阵
//    NSMutableArray <NSMutableArray *>*rows = [NSMutableArray arrayWithCapacity:numRows];
//    for (NSInteger i=0; i<numRows; i++) {
//        NSMutableArray <NSString *>*tempArr = [NSMutableArray arrayWithCapacity:c];
//        for (NSInteger j=0; j<c; j++) {
//            tempArr[j] = @"";
//        }
//        rows[i] = tempArr;
//    }
//
//    NSInteger x = 0;
//    NSInteger y = 0;
//
//    //遍历字符串
//    for (NSInteger i=0; i<len; i++) {
//        unichar unichar = [s characterAtIndex:i];
//        NSString *res = [[NSString alloc] initWithCharacters:&unichar length:1];
//
//        rows[x][y] = res;
//        if (i % t < numRows-1) {//向下填充
//            ++x;
//        }else {//向斜上填充
//            --x;
//            ++y;
//        }
//    }
//
//    NSString *result = @"";
//    for (NSInteger i=0; i<numRows; i++) {
//        for (NSInteger j=0; j<c; j++) {
//            NSString *val = rows[i][j];
//            if (val.length > 0) {
//                result = [result stringByAppendingString:val];
//            }
//        }
//    }
//
//    return result;
//}



/***********************************************God like***********************************************/
//K神flag解法(*****推荐 )
/*
 通过标志位，控制索引在numRows层来回扫描，思路清晰简洁
 */
- (NSString *)convert:(NSString *)s numRows:(NSInteger)numRows {
    if (numRows < 2) {
        return s;
    }
    
    NSInteger len = s.length;
    
    //构造存储字符串的数组
    NSMutableArray <NSString *>*datas = [NSMutableArray array];
    for (NSInteger i=0; i<numRows; i++) {
        datas[i] = @"";
    }
    
    NSInteger idx = 0, flag = -1;
    
    for (NSInteger i=0; i<len; i++) {
        unichar unichar = [s characterAtIndex:i];
        NSString *res = [[NSString alloc] initWithCharacters:&unichar length:1];
        
        datas[idx] = [datas[idx] stringByAppendingString:res];
        
        if (idx == 0 || idx == numRows-1) {
            flag = - flag;
        }
        idx += flag;
    }
    
    NSString *result = @"";
    for (NSString *str in datas) {
        result = [result stringByAppendingString:str];
    }
    
    return result;
}


#pragma mark - 7
-(int)reverse:(int)x {
    int n = 0;
    
    while (x) {
        n = n * 10 + x % 10;
        x /= 10;
    }
    
    if (n > INT32_MAX || n < INT32_MIN) {
        return 0;
    }else {
        return n;
    }
}


#pragma mark - 8
- (int)myAtoi:(NSString *)s {
    Automation *autom = [[Automation alloc] init];
    
    for (NSInteger i=0; i<s.length; i++) {
        unichar unichar = [s characterAtIndex:i];
        
        [autom getChar:unichar];
    }
    int res = [autom getFixedresult];
    return res;
}

#pragma mark - 9
- (BOOL)isPalindrome:(NSInteger)x {
    //处理边界情况
    if (x < 0 || (x%10 == 0 && x/10 != 0)) {
        return NO;
    }
    
    //翻转一半后判断是否相等即可确定是否为回文数
    NSInteger reversedNum = 0;
    while (x > reversedNum) {
        reversedNum = reversedNum * 10 + x%10;
        x /= 10;
    }
    
    //奇数时多一位，因此除以10
    if (x == reversedNum || x == reversedNum/10) {
        return YES;
    }
    return NO;
}

@end





@implementation Automation {
    NSDictionary <NSNumber *, NSArray *>*_transitionTable;
    
    StateEnum _state;
}

- (instancetype)init {
    if (self = [super init]) {
        
        _flagV = 1;
        _num = 0;
        _state = StateEnumStart;
        
        _transitionTable = @{
           @(StateEnumStart) : @[@(StateEnumStart), @(StateEnumSigned), @(StateEnumInNumber), @(StateEnumEnd)],
           @(StateEnumSigned) : @[@(StateEnumEnd), @(StateEnumEnd), @(StateEnumInNumber), @(StateEnumEnd)],
           @(StateEnumInNumber) : @[@(StateEnumEnd), @(StateEnumEnd), @(StateEnumInNumber), @(StateEnumEnd)],
           @(StateEnumEnd) : @[@(StateEnumEnd), @(StateEnumEnd), @(StateEnumEnd), @(StateEnumEnd)],
        };
        
        return self;
    }
    
    return nil;
}

- (void)getChar:(unichar)character {
    
    NSInteger idx = [self getIndexOfCharacter:character];
    NSArray *states = [_transitionTable objectForKey:@((NSInteger)_state)];
    _state = (StateEnum)[states[idx] integerValue];
    
    if (_state == StateEnumInNumber) {
        if (_num == 214748364) {
            NSLog(@"");
        }
        int value = character - '0';
        if (_num >= INT32_MAX/10 || ( _num == INT32_MAX/10 && value >= INT32_MAX%10)) {
            _num = INT32_MAX;
            return;
        }
        _num = _num * 10 + value;
    }else if(_state == StateEnumSigned) {
        if (character == '+') {
            self.flagV = 1;
        }else if(character == '-') {
            self.flagV = - 1;
        }
    }
}

- (NSInteger)getIndexOfCharacter:(unichar)character {
    if (character == ' ') {
        return 0;
    }
    
    if (character == '+' || character == '-') {
        return 1;
    }
    
    if (character >= '0' && character <= '9') {
        return 2;
    }
    
    return 3;
}

- (int)getFixedresult {
    int res = 0;
    if (self.flagV == -1 && self.num == INT32_MAX) {
        res = INT32_MIN;
    }else {
        res = self.flagV * self.num;
    }
    
    return res;
}

@end
