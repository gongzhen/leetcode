//
//  main.m
//  LC
//
//  Created by ULS on 2/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LC692.h"
#import "LC999.h"
#import "LC998.h"
#import "LC997.h"
#import "LC996.h"
#import "LC498.h"
#import "LC127.h"
#import "LC173.h"
#import "LC256.h"
#import "LC26.h"
#import "LC84.h"
#import "LC4.h"
#import "LC451.h"
#import "LC11.h"
#import "LC38.h"
#import "LC410.h"
#import "LC282.h"
#import "LC68.h"
#import "LC71.h"
#import "LC274.h"
#import "LC673.h"
#import "LC745.h"
#import "LC269.h"
#import "LC257.h"
#import "LC146.h"
#import "LC283.h"
#import "LC689.h"
#import "LC801.h"
#import "LC301.h"
#import "LC621.h"
#import "LC67.h"
#import "LC95.h"
#import "LC273.h"
#import "LC253.h"
#import "LC325.h"
#import "LC17.h"
#import "LC314.h"
#import "LC15.h"
#import "LC297.h"
#import "LC311.h"
#import "LC158.h"
#import "LC90.h"
#import "LC278.h"
#import "LC265.h"
#import "LC200.h"
#import "LC76.h"
#import "LC543.h"
#import "LC23.h"
#import "LC157.h"
#import "LC125.h"
#import "LC211.h"
#import "LC121.h"
#import "LC56.h"
#import "LC1.h"
#import "LC10.h"
#import "LC680.h"
#import "LC102.h"
#import "LC128.h"
#import "LC252.h"
#import "LC161.h"
#import "LC98.h"
#import "LC78.h"
#import "LC133.h"
#import "LC43.h"
#import "LCTree.h"
#import "LC285.h"
#import "LC215.h"
#import "LC139.h"
#import "LC57.h"
#import "LC238.h"
#import "LC75.h"
#import "LC33.h"
#import "LC88.h"
#import "LC85.h"
#import "LC670.h"
#import "LC206.h"
#import "LC79.h"
#import "LC494.h"
#import "LC207.h"
#import "LC210.h"
#import "LC261.h"
#import "LC54.h"
#import "LC53.h"
#import "LC117.h"
#import "LC44.h"
#import "LC445.h"
#import "LC2.h"
#import "LC31.h"
#import "LC91.h"
#import "LC236.h"
#import "LC523.h"
#import "LC347.h"
#import "LC286.h"
#import "LC130.h"
#import "LC49.h"
#import "LC209.h"
#import "LC3.h"
#import "LC30.h"
#import "Queue.h"
#import "BinarySearchTree.h"
#import "LC208.h"
#import "LC218.h"
#import "LC721.h"
#import "LINT543.h"
#import "LC16.h"
#import "LC658.h"
#import "LC642.h"
#import "Trie.h"
#import "LC995.h"
#import "LC994.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        LC146 *lc146 = [[LC146 alloc] init];
//        [lc146 test];
//        LC283 *lc283 = [[LC283 alloc] init];
//        [lc283 test];
//        LC301 *lc301 = [[LC301 alloc] init];
//        [lc301 test];
//        LC621 *lc621 = [[LC621 alloc] init];
//        [lc621 test];
//        LC67 *lc67 = [[LC67 alloc] init];
//        [lc67 test];
//        LC273 *lc273 = [[LC273 alloc] init];
//        [lc273 test];
//        LC253 *lc253 = [[LC253 alloc] init];
//        [lc253 test];
//        [lc253 testPQ];
//        LC325 *lc325 = [[LC325 alloc] init];
//        [lc325 test];
//        LC17 *lc17 = [[LC17 alloc] init];
//        [lc17 test];
//        LC314 *lc314 = [[LC314 alloc] init];
//        [lc314 test];
//        LC15 *lc15 = [[LC15 alloc] init];
//        [lc15 test];
//        LC297 *lc297 = [[LC297 alloc] init];
//        [lc297 test];
//        LC311 *lc311 = [[LC311 alloc] init];
//        [lc311 test];
//        LC158 *lc158 = [[LC158 alloc] init];
//        [lc158 test];
//        LC278 *lc278 = [[LC278 alloc] init];
//        [lc278 test];
//        LC200 *lc200 = [[LC200 alloc] init];
//        [lc200 test];
//        LC76 *lc76 = [[LC76 alloc] init];
//        [lc76 test];
//        LC543 *lc543 = [[LC543 alloc] init];
//        [lc543 test];
//        LC23 *lc23 = [[LC23 alloc] init];
//        [lc23 test];
//        LC157 *lc157 = [[LC157 alloc] init];
//        [lc157 test];
//        LC125 *lc125 = [[LC125 alloc] init];
//        [lc125 test];
//        LC211 *lc211 = [[LC211 alloc] init];
//        [lc211 test];
//        LC121 *lc121 = [[LC121 alloc] init];
//        [lc121 test];
//        LC56 *lc56 = [[LC56 alloc] init];
//        [lc56 test];
//        LC1 *lc1 = [[LC1 alloc] init];
//        [lc1 test];
//        LC680 *lc680 = [[LC680 alloc] init];
//        [lc680 test];
//        LC252 *lc252 = [[LC252 alloc] init];
//        [lc252 test];
//        LC161 *lc161 = [[LC161 alloc] init];
//        [lc161 test];
//        LC98 *lc98 = [[LC98 alloc] init];
//        [lc98 test];
//        LC78 *lc78 = [[LC78 alloc] init];
//        [lc78 test];
//        LC133 *lc133 = [[LC133 alloc] init];
//        [lc133 test];
//        LC43 *lc43 = [[LC43 alloc] init];
//        [lc43 test];
//        Tree *tree = [[Tree alloc] init];
//        [tree test];
//        LC285 *lc285 = [[LC285 alloc] init];
//        [lc285 test];
//        LC215 *lc215 = [[LC215 alloc] init];
//        [lc215 test];
//        LC139 *lc139 = [[LC139 alloc] init];
//        [lc139 test];
//        LC57 *lc57 = [[LC57 alloc] init];
//        [lc57 test];
//        LC238 *lc238 = [[LC238 alloc] init];
//        [lc238 test];
//        LC75 *lc75 = [[LC75 alloc] init];
//        [lc75 test];
//        LC33 *lc33 = [[LC33 alloc] init];
//        [lc33 test];
//        LC88 *lc88 = [[LC88 alloc] init];
//        [lc88 test];
//        LC670 *lc670 = [[LC670 alloc] init];
//        [lc670 test];
//        LC206 *lc206 = [[LC206 alloc] init];
//        [lc206 test];
//        LC79 *lc79 = [[LC79 alloc] init];
//        [lc79 test];
//        LC494 *lc494 = [[LC494 alloc] init];
//        [lc494 test];
//        LC207 *lc207 = [[LC207 alloc] init];
//        [lc207 test];
//        LC210 *lc210 = [[LC210 alloc] init];
//        [lc210 test];
//        LC261 *lc261 = [[LC261 alloc] init];
//        [lc261 test];
//        LC54 *lc54 = [[LC54 alloc] init];
//        [lc54 test];
//        LC53 *lc53 = [[LC53 alloc] init];
//        [lc53 test];
//        LC117 *lc117 = [[LC117 alloc] init];
//        [lc117 test];
//        LC44 *lc44 = [[LC44 alloc] init];
//        [lc44 test];
//        LC10 *lc10 = [[LC10 alloc] init];
//        [lc10 test];
//        LC445 *lc445 = [[LC445 alloc] init];
//        [lc445 test];
//        LC2 *lc2 = [[LC2 alloc] init];
//        [lc2 test];
//        LC91 *lc91 = [[LC91 alloc] init];
//        [lc91 test];
//        LC236 *lc236 = [[LC236 alloc] init];
//        [lc236 test];
//        LC523 *lc523 = [[LC523 alloc] init];
//        [lc523 test];
//        LC347 *lc347 = [[LC347 alloc] init];
//        [lc347 test];
//        LC286 *lc286 = [[LC286 alloc] init];
//        [lc286 test];
//        LC130 *lc130 = [[LC130 alloc] init];
//        [lc130 test];
//        LC49 *lc49 = [[LC49 alloc] init];
//        [lc49 test];
//        LC209 *lc209 = [[LC209 alloc] init];
//        [lc209 test];
//        LC3 *lc3 = [[LC3 alloc] init];
//        [lc3 test];
//        LC30 *lc30 = [[LC30 alloc] init];
//        [lc30 test];
//        Queue *queue = [Queue queue];
//        [queue test];
//        BinarySearchTree *btree = [[BinarySearchTree alloc] init];
//        [btree test];
        LC208 *lc208 = [[LC208 alloc] init];
        [lc208 test];
//        LC218 *lc218 = [[LC218 alloc] init];
//        [lc218 test];
//        LC721 *lc721 = [[LC721 alloc] init];
//        [lc721 test];
//        LINT543 *lc543 = [[LINT543 alloc] init];
//        [lc543 test];
//        [lc543 testPQ];
//        LC16 *lc16 = [[LC16 alloc] init];
//        [lc16 test];
//        LC658 *lc658 = [[LC658 alloc] init];
//        [lc658 test];
//        LC999 *lc999 = [[LC999 alloc] init];
//        [lc999 test];
//        LC998 *lc998 = [[LC998 alloc] init];
//        [lc998 test];
//        LC498 *lc498 = [[LC498 alloc] init];
//        [lc498 test];
//        LC38 *lc38 = [[LC38 alloc] init];
//        [lc38 test];
//        LC997 *lc997 = [[LC997 alloc] init];
//        [lc997 test];
//        LC257 *lc257 = [[LC257 alloc] init];
//        [lc257 test];
//        LC127 *lc127 = [[LC127 alloc] init];
//        [lc127 test];
//        LC95 *lc95 = [[LC95 alloc] init];
//        [lc95 test];
//        LCTree *tree = [[LCTree alloc] init];
//        [tree test];
//        LC173 *lc173 = [[LC173 alloc] initWithRoot:[tree bst]];
//        [lc173 test];
//        LC996 *lc996 = [[LC996 alloc] init];
//        [lc996 test];
//        LC102 *lc102 = [[LC102 alloc] init];
//        [lc102 test];
//        LC68 *lc68 = [[LC68 alloc] init];
//        [lc68 test];
//        char* words[2] = {"apple", "alive"};
//        LC745 *lc745 = [[LC745 alloc] initWithWords:words len:2];
//        [lc745 test];
//        LC269 *lc269 = [[LC269 alloc] init];
//        [lc269 test];
//        LC85 *lc85 = [[LC85 alloc] init];
//        [lc85 test];
//        LC282 *lc282 = [[LC282 alloc] init];
//        [lc282 test];
//        LC642 *lc642 = [[LC642 alloc] init];
//        [lc642 test];
//        LC410 *lc410 = [[LC410 alloc] init];
//        [lc410 test];
//        LC256 *lc256 = [[LC256 alloc] init];
//        [lc256 test];
//        LC265 *lc265 = [[LC265 alloc] init];
//        [lc265 test];
//        LC128 *lc128 = [[LC128 alloc] init];
//        [lc128 test];
//        LC84 *lc84 = [[LC84 alloc] init];
//        [lc84 test];
//        LC801 *lc801 = [[LC801 alloc] init];
//        [lc801 test];
//        LC71 *lc71 = [[LC71 alloc] init];
//        [lc71 test];
//        LC673 *lc673 = [[LC673 alloc] init];
//        [lc673 test];
//        LC274 *lc274 = [[LC274 alloc] init];
//        [lc274 test];
//        LC90 *lc90 = [[LC90 alloc] init];
//        [lc90 test];
//        Trie *trie = [[Trie alloc] init];
//        [trie insert:@"asdasdasdsa"];
//        [trie insert:@"a"];
//        [trie insert:@"nms"];
//        [trie insert:@"ab"];
//        [trie insert:@"bbb"];
//        [trie insert:@"adsadas"];
//        NSSet *expectedList1 = [NSSet setWithArray:@[@"asdasdasdsa", @"a", @"ab", @"adsadas"]];
//        NSArray *result = [trie listStartWith:@"a"];
//        if(result.count == expectedList1.count) {
//            [result enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                NSString *word = (NSString *)obj;
//                if([expectedList1 containsObject:word] == NO) {
//                    DLog(@"word:%@ is not found.", word);
//                }
//                DLog(@"word:%@", word);
//            }];
//        }
//        NSArray *result1 = [trie listStartWith:@"z"];
//        DLog(@"result1.count == 0:%ld", result1.count);
//        LC995 *obj = [[LC995 alloc] init];
//        [obj test];
//        LC994 *obj = [[LC994 alloc] init];
//        [obj test];
//        LC4 *obj = [[LC4 alloc] init];
//        [obj test];
//        LC11 *obj = [[LC11 alloc] init];
//        [obj test];
//        LC26 *lc26 = [[LC26 alloc] init];
//        [lc26 test];
//        LC31 *lc31 = [[LC31 alloc] init];
//        [lc31 test];
//        LC451 *lc451 = [[LC451 alloc] init];
//        [lc451 test];
//        LC692 *lc692 = [[LC692 alloc] init];
//        [lc692 test];
    }
    return 0;
}
