//
//  DropboxInterview.m
//  LC
//
//  Created by Zhen Gong on 11/12/19.
//  Copyright © 2019 ULS. All rights reserved.
//  https://www.dropbox.com/scl/fi/6dkg1y66xq5i8njhjigo4/Columnar%20Layout%201.png?dl=0
//  https://www.dropbox.com/scl/fi/q1caex5bqtazp6zdrpf3d/Columnar%20Layout%202.png?dl=0

#import "DropboxInterview.h"
#import "DBPoint.h"

/**
 #import <Foundation/Foundation.h>
 #import <stdio.h>
 // https://www.dropbox.com/scl/fi/6dkg1y66xq5i8njhjigo4/Columnar%20Layout%201.png?dl=0
 // https://www.dropbox.com/scl/fi/q1caex5bqtazp6zdrpf3d/Columnar%20Layout%202.png?dl=0


 @interface DBPoint : NSObject
 // Returns an instance of a DBPoint with the provided X and Y coordinates
 + (instancetype)pointWithX:(NSInteger)x Y:(NSInteger)y;

 @property (nonatomic, assign) NSInteger x;
 @property (nonatomic, assign) NSInteger y;
 @end

 @interface DBSize : NSObject
 //Returns an instance of a DBSize with the provided width and height
 + (instancetype)sizeWithWidth:(NSInteger)width height:(NSInteger)height;

 @property (nonatomic, assign) NSInteger width;
 @property (nonatomic, assign) NSInteger height;
 @end

 @interface DBColumnarLayout : NSObject
 + (NSArray<DBPoint *> *)layoutChildViewsWithParentViewSize:(DBSize *)parentViewSize childViewSizes:(NSArray<DBSize *> *)childViewSizes center:(BOOL)center;
 @end

 @implementation DBColumnarLayout
 + (NSArray<DBPoint *> *)layoutChildViewsWithParentViewSize:(DBSize *)parentViewSize childViewSizes:(NSArray<DBSize *> *)childViewSizes center:(BOOL)center
 {
   // Please implement me
   if (childViewSizes.count == 0 || parentViewSize == nil) {
     return [NSArray array];
   }
   
   NSInteger totalWidth = parentViewSize.width;
   NSInteger totalHeight = parentViewSize.height;
   // loop children views
   DBPoint *origin = [DBPoint pointWithX:0 Y:0];
   
   NSMutableArray <DBPoint *> *result = [NSMutableArray array];
   NSMutableArray <Dictionary<DBSize, DBPoint> *> *temDict = [Dcitionary array];
   NSInteger currentMaxWidth = 0;
   for(DBSize *childView in childViewSizes) {
     NSInteger _width = childView.width;
     NSInteger _height = childView.height;
     if (_width > totalWidth || _height  > totalHeight || _width + origin.x > totalWidth) {
       return result;
     } else if (_height + origin.y > totalHeight) {
       // move to next column
       origin.x = origin.x + currentMaxWidth;
       origin.y = 0;
       if (origin.x + _width > totalWidth) {
         return result;
       }
       // recualute temp
       isSwitched = true;
       if (center == YES) {
         for(DBPoint *point in temDict) {
           DBSize childSize = [temDict objectForkey:point]
           point.x = point.x + (currentMaxWidth -  childSize)/ 2 + point.x;
           [res addObject:[Point pintWith:point.x Y:pointy];
         }
       } else {
         for(DBPoint *point in temDict) {
           [res addObject:[Point pintWith:point.x Y:pointy];
         }
       }
       [temDict removeAll];
     }
     
     if (currentMaxWidth < _width) {
        currentMaxWidth = _width;
     }
     
     NSInteger _currentX = origin.x;
     NSInteger _currentY = origin.y;
     
     [temDict setObject:childView forKey:[Point pointWith:_currentX, Y;_currenty]];
     // update origin
     origin.y = origin.y + _height;
   }
   
   
   return result;
 }
 @end


 int main (int argc, const char * argv[])
 {
   @autoreleasepool {
     NSString* hello = @"Hello, World!";
     for (int i = 1; i <= 5; i++) {
       printf("%s #%d\n", [hello UTF8String], i);
     }
   }
 }

 
 **/

@interface SizePointPair : NSObject

@property(strong, nonatomic)DBSize *size;
@property(strong, nonatomic)DBPoint *point;

- (instancetype)initWithSize:(DBSize *)size point:(DBPoint *)point;

@end

@implementation SizePointPair

- (instancetype)initWithSize:(DBSize *)size point:(DBPoint *)point {
    if (self = [super init]) {
        _size = size;
        _point = point;
    }
    return self;
}

@end

@implementation DropboxInterview

+ (NSArray<DBPoint *> *)layoutChildViewsWithParentViewSize:(DBSize *)parentViewSize childViewSizes:(NSArray<DBSize *> *)childViewSizes center:(BOOL)center
{
    if (parentViewSize == nil || childViewSizes.count ==0) {
        return [NSArray array];
    }
    
    NSInteger totalWidth = parentViewSize.width;
    NSInteger totalHeight = parentViewSize.height;
    
    NSMutableArray<DBPoint *> *result = [NSMutableArray array];
    NSMutableArray<SizePointPair *> *temList = [NSMutableArray array];
    DBPoint* _currentOrigin = [DBPoint pointWithX:0 Y:0];
    NSInteger currentMaxWidth = 0;
    int i = 0;
    for(DBSize *childView in childViewSizes) {
        i++;
        NSInteger _width = childView.width;
        NSInteger _height = childView.height;
        if (_width > totalWidth || _height > totalHeight || _currentOrigin.x + _width > totalWidth) {
            // return result;
            break;
        } else if (_currentOrigin.y + _height > totalHeight) {
            _currentOrigin.x = _currentOrigin.x + currentMaxWidth;
            _currentOrigin.y = 0;
            if (_currentOrigin.x + _width > totalWidth) {
                // return result; // handle last column
                break;
            }
            for(SizePointPair *pair in temList) {
                DBPoint *point = pair.point;
                DBSize *size = pair.size;
                if (center == YES) {
                    point.x = point.x + (currentMaxWidth - size.width) / 2;
                }
                
                [result addObject:point];
            }
            [temList removeAllObjects];
        }
        
        DBPoint *_point = [DBPoint pointWithX:_currentOrigin.x Y:_currentOrigin.y];
        [temList addObject:[[SizePointPair alloc] initWithSize:childView point:_point]];
        _currentOrigin.x = _currentOrigin.x + _width;
        _currentOrigin.y = _currentOrigin.y + _height;
        if (currentMaxWidth < _width) {
            currentMaxWidth = _width;
        }
    }
    if (temList.count != 0) {
        for(SizePointPair *pair in temList) {
            DBPoint *point = pair.point;
            DBSize *size = pair.size;
            if (center == YES) {
                point.x = point.x + (currentMaxWidth - size.width) / 2;
            }
            
            [result addObject:point];
        }
        [temList removeAllObjects];
    }
    
    return result;
}
@end
