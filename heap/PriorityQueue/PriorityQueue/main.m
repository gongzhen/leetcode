//
//  main.m
//  PriorityQueue
//
//  Created by Admin  on 12/21/17.
//  Copyright © 2017 Admin . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PriorityQueue.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        PriorityQueue *pq = [[PriorityQueue alloc] init];
        [pq offer:[NSNumber numberWithInteger:8]];
        [pq offer:[NSNumber numberWithInteger:9]];
        [pq offer:[NSNumber numberWithInteger:13]];
        [pq offer:[NSNumber numberWithInteger:11]];
        [pq offer:[NSNumber numberWithInteger:12]];
        while(![pq isEmpty]) {
            NSNumber *e = [pq poll];
            DLog(@"e:%ld", [e integerValue]);
        }
    }
    return 0;
}
