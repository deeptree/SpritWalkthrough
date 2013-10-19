//
// SpaceshipScene.m
// SpriteWalkthrough
//
// Created by deeptree on 2013/10/17.
// Copyright (c) 2013年 deeptree. All rights reserved.
//

#import "SpaceshipScene.h"

@interface SpaceshipScene ()
@property BOOL contentCreated;
@property SKSpriteNode *spaceship;
@end

@implementation SpaceshipScene

- (void) didMoveToView:(SKView *)view
{
	if (!self.contentCreated) {
		[self createSceneContents];
		self.contentCreated = YES;
	}
}

- (void) createSceneContents
{
	self.backgroundColor = [SKColor blackColor];
	self.scaleMode = SKSceneScaleModeAspectFit;

	self.spaceship = [self newSpaceship];

	self.spaceship.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 150);
	[self addChild:self.spaceship];

	SKAction *makeRocks = [SKAction sequence:@[
	                               [SKAction performSelector:@selector(addRock) onTarget:self],
	                               [SKAction waitForDuration:0.10 withRange:0.15]
	                       ]];

	[self runAction:[SKAction repeatActionForever:makeRocks]];

    //add a node wheel 2013.10/19 JJ

    //This wouldn't create a new node instance !
    //    SKSpriteNode *wheel = (SKSpriteNode *)[self childNodeWithName:@"wheel"];

    //This will do create a new node instance !
    SKSpriteNode *wheel = [[SKSpriteNode alloc] initWithColor:[SKColor redColor] size:CGSizeMake(64, 32)];


    CGFloat circumference = wheel.size.height * M_PI;

    SKAction *oneRevolution = [SKAction rotateByAngle:-M_PI*2 duration:2.0];
    SKAction *moveRight = [SKAction moveByX:circumference y:0 duration:2.0];

    SKAction *group = [SKAction group:@[oneRevolution, moveRight]];
    [wheel runAction:[SKAction repeatActionForever:group]];
    wheel.position =  CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 20);

    wheel.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:wheel.size];
	wheel.physicsBody.dynamic = NO;

    [self addChild: wheel];
}

- (SKSpriteNode *) newSpaceship
{
	SKSpriteNode *hull = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(64, 32)];
//	SKSpriteNode *hull = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(600, 32)];
	SKAction *hover = [SKAction sequence:@[
	                           [SKAction waitForDuration:1.0],
	                           [SKAction moveByX:100 y:50.0 duration:1.0],
	                           [SKAction waitForDuration:1.0],
	                           [SKAction moveByX:-100.0 y:-50 duration:1.0]]];

//旋轉試做
//	SKAction *hover = [SKAction sequence:@[
//                                           [SKAction waitForDuration:1.0],
//                                           [SKAction rotateByAngle:180.0 duration:1.0],
//                                           [SKAction waitForDuration:1.0]
//                                        ]];
	[hull runAction:[SKAction repeatActionForever:hover]];

	// add light node to spaceship
	SKSpriteNode *light1 = [self newLight];

	light1.position = CGPointMake(-28.0, 6.0);
	[hull addChild:light1];

	SKSpriteNode *light2 = [self newLight];

	light2.position = CGPointMake(28.0, 6.0);
	[hull addChild:light2];

	// add physics simulation
	hull.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:hull.size];
	hull.physicsBody.dynamic = NO;

	return hull;
}

- (SKSpriteNode *) newLight
{
	SKSpriteNode *light = [[SKSpriteNode alloc] initWithColor:[SKColor yellowColor] size:CGSizeMake(8, 8)];

	SKAction *blink = [SKAction sequence:@[
	                           [SKAction fadeOutWithDuration:0.25],
	                           [SKAction fadeInWithDuration:0.25]]];
	SKAction *blinkForever = [SKAction repeatActionForever:blink];

	[light runAction:blinkForever];

	return light;
}

static inline CGFloat skRandf()
{
	return rand() / (CGFloat) RAND_MAX;
}

static inline CGFloat skRand(CGFloat low, CGFloat high)
{
	return skRandf() * (high - low) + low;
}

- (void) addRock
{
	SKSpriteNode *rock = [[SKSpriteNode alloc] initWithColor:[SKColor brownColor] size:CGSizeMake(8, 8)];

	rock.position = CGPointMake(skRand(0, self.size.width), self.size.height - 50);
	rock.name = @"rock";
	rock.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:rock.size];
    rock.physicsBody.friction = 0.6;
	rock.physicsBody.usesPreciseCollisionDetection = YES;
	[self addChild:rock];
}

-(void)didSimulatePhysics
{
    [self enumerateChildNodesWithName:@"rock" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.y < 0)
            [node removeFromParent];
    }];
}




@end
