//
//  HelloScene.m
//  SpriteWalkthrough
//
//  Created by deeptree on 2013/10/17.
//  Copyright (c) 2013年 deeptree. All rights reserved.
//

#import "HelloScene.h"

@interface HelloScene()
@property BOOL contentCreated;
@end

@implementation HelloScene

-(void) didMoveToView:(SKView *)view
{
    if (!self.contentCreated) {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

-(void) createSceneContents
{
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild: [self newHelloNode]];
}

-(SKLabelNode *)newHelloNode
{
    
    SKLabelNode *helloNode = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    helloNode.text = @"Hello, JJ";
    helloNode.fontSize = 42;
    helloNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    return helloNode;
}

@end
