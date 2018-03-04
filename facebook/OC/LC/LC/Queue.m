//
//  Queue.m
//  LC
//
//  Created by ULS on 2/22/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "Queue.h"

@interface Entry<ObjectType>:NSObject
{
    @public
    id _element;
}

@property(nonatomic, strong) Entry<ObjectType> *next;
@property(nonatomic, strong) Entry<ObjectType> *previous;

@end

@implementation Entry

- (instancetype)initWith:(id)element next:(Entry *)next previous:(Entry *)previous {
    if(self = [super init]) {
        _element = element;
        _next = next;
        _previous = previous;
    }
    return self;
}

@end

@interface Queue() {
    NSMutableArray* _array;
    Entry *_header;
    NSUInteger _size;
}

@end

@implementation Queue

+ (instancetype)queue {;
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (instancetype)init {
    if(self = [super init]) {
        _array = [NSMutableArray array];
        _header = [[Entry alloc] initWith:NULL next:NULL previous:NULL];
        _header.next = _header;
        _header.previous = _header;
        _size = 0;
    }
    return self;
}

- (BOOL)offer:(id)e {
    return [self add:e];
}

- (BOOL)add:(id)e {
    [self addBefore:e entry:_header];
    return YES;
}

- (Entry *)addBefore:(id)element entry:(Entry *)entry {
    ///    |---------------------------\|/
    /// header <==> entry1 <==> entry2 =|
    ///   /|\___________________________|
    Entry *newEntry = [[Entry alloc] initWith:element next:entry previous:entry.previous];
    newEntry.previous.next = newEntry;
    newEntry.next.previous = newEntry;
    _size++;
    DLog(@"%@ and size is %ld", (newEntry->_element), _size);
    return newEntry;
}

- (id)poll {
    if(_size == 0) {
        return NULL;
    }
    return [self removeFirst];
}

- (id)removeFirst {
    return [self remove:_header.next];
}

- (id)remove:(Entry *)e {
    if(e == _header) {
        return NULL;
    }
    id result = e->_element;
    e.previous.next = e.next;
    e.next.previous = e.previous;
    e.next = NULL;
    e.previous = NULL;
    e->_element = NULL;
    _size--;
    DLog(@"%@ and size is %ld", result, _size);
    return result;
}

- (id)peek {
    if(_size == 0) {
        return NULL;
    }
    return [self getFirst];
}

- (id)getFirst {
    if(_size == 0) {
        return NULL;
    }
    return _header.next->_element;
}

- (BOOL)isEmpty {
    return _size == 0;
}

- (NSInteger)getSize {
    return _size;
}

- (void)test {
    
//    [self offer:@(1)];
//    [self offer:@(2)];
//    [self offer:@(3)];
//
//    Entry *ptr = _header.next;
//    int i = 0;
//    while(ptr != NULL) {
//        NSNumber *num = (NSNumber *)(ptr->_element);
//        DLog(@"%d", [num intValue]);
//        ptr = ptr.next;
//        i++;
//        if(i == 10) {
//            break;
//        }
//    }
    
    [self offer:@"A"];
    [self offer:@"B"];
    [self offer:@"C"];
    
    Entry *ptr = _header.next;
    int i = 0;
    while(ptr != NULL) {
        NSString *num = (NSString *)(ptr->_element);
        DLog(@"%@", num);
        ptr = ptr.next;
        i++;
        if(i == 10) {
            break;
        }
    }
    
    DLog(@"peek: %@", [self peek]);
    DLog(@"poll: %@", [self poll]);
    DLog(@"peek: %@", [self peek]);
    DLog(@"poll: %@", [self poll]);
    DLog(@"peek: %@", [self peek]);
    DLog(@"poll: %@", [self poll]);
    DLog(@"peek: %@", [self peek]);
}


@end
