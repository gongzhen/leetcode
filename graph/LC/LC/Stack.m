//
//  Stack.m
//  LC
//
//  Created by ULS on 3/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "Stack.h"

@interface Stack()

@end

@implementation Stack {
    void ** _pointer;
    NSUInteger _capacityIncrement;
    NSInteger _elementCount;
}

- (instancetype)init {
    self = [super init];
    if(self != NULL) {
        [self initWithPacaity:10 capacityIncrement:0];
    }
    return self;
}

- (instancetype)initWithCapacity:(NSInteger)initialCapacity capacityIncrement:(NSInteger)capacityIncrement {
    self = [super init];
    if(self != NULL) {
        [self initWithPacaity:initialCapacity capacityIncrement:capacityIncrement];
    }
    return self;
}

- (instancetype)initWithCapacity:(NSInteger)initialCapacity {
    self = [super init];
    if(self != NULL) {
        [self initWithPacaity:initialCapacity capacityIncrement:0];
    }
    return self;
}

- (void)initWithPacaity:(NSInteger)initialCapacity capacityIncrement:(NSInteger)capacityIncrement {
    _pointer = (void **)malloc(initialCapacity * sizeof(void *));
    _capacityIncrement = capacityIncrement;
    _elementCount = 0;
}

- (void)dealloc {
    for(int i = 0; i < _elementCount; i++) {
        free(_pointer[i]);
    }
    free(_pointer);
}

- (id)push:(id)obj {
    [self addElement:obj];
    return obj;
}

- (id)pop {
    @synchronized(self) {
        id obj;
        NSInteger len = [self size];
        obj = [self peek];
        [self removeElementAt:len - 1];
        return obj;
    }
}

- (id)peek {
    @synchronized(self) {
        NSInteger len = [self size];
        if(len == 0) {
            return NULL;
        }
        return [self elementAt:len - 1];
    }
}

- (BOOL)empty {
    return [self size] == 0;
}

- (void)addElement:(id)obj {
    @synchronized(self) {
        [self ensureCapacityHelper:_elementCount + 1];
        _pointer[_elementCount++] = (__bridge void *)(obj);
    }
}

- (void)ensureCapacityHelper:(NSUInteger)minCapacity {
    
}

- (NSInteger)size {
    @synchronized(self) {
        return _elementCount;
    }
}

- (void)removeElementAt:(NSInteger)index {
    @synchronized(self) {
        if(index >= _elementCount) {
            return;
        } else if (index < 0) {
            return;
        }
        NSInteger j = _elementCount - index - 1;
        [self arraycopy:_pointer srcPos:index + 1 dest:_pointer destPos:index length:j];
        _elementCount--;
        _pointer[_elementCount] = NULL;
    }
}

- (void)arraycopy:(void **)src srcPos:(NSInteger)srcPos dest:(void **)dest destPos:(NSInteger)destPos length:(NSInteger)length {
    
    for(NSInteger i = srcPos, j = destPos; i < _elementCount && j < _elementCount && i < srcPos + length && j < destPos + length; i++, j++) {
        dest[j] = src[i];
    }
}

- (id)elementAt:(NSInteger)index {
    @synchronized(self) {
        if(index >= _elementCount) {
            return NULL;
        }
        return (__bridge id)(_pointer[index]);
    }
}

@end
