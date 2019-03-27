//
//  AddDelegateToQueue.h
//  LC
//
//  Created by Zhen Gong on 12/24/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC.h"

@protocol GRChatManagerDelegate <NSObject>
- (void)chatManager;
@end

@protocol GRXMPPManagerDeleate <NSObject>
- (void)xmppManager;
@end

@interface AddDelegateToQueue : LC

- (void)addDelegate:(id<GRChatManagerDelegate>)delegate;

@end
