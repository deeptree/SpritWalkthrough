//
//  SpaceshipScene.m
//  SpriteWalkthrough
//
//  Created by deeptree on 2013/10/17.
//  Copyright (c) 2013年 deeptree. All rights reserved.
//

#import "SpaceshipScene.h"

@interface SpaceshipScene ()
@property BOOL contentCreated;
@end

@implementation SpaceshipScene

- (void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

- (void)createSceneContents
{
    self.backgroundColor = [SKColor blackColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
}

@end
