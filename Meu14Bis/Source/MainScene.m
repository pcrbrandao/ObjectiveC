#import "MainScene.h"
#import "TitleScreenNode.h"
#import "CCTransition.h"

@implementation MainScene

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
     
    // The thing is, that if this fails, your app will 99.99% crash anyways, so why bother
    // Just make an assert, so that you can catch it in debug
    NSAssert(self, @"Whoops");
    
    // acrescenta background
    [self addChild:self.background];
    
    /* Codigo original
    
    // Background
    CCSprite *sprite = [CCSprite spriteWithImageNamed:@"ic_launcher.png"];
    sprite.position = ccp(0.5, 0.5);
    sprite.positionType = CCPositionTypeNormalized;
    [self addChild:sprite];
    
    // The standard Hello World text
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"ArialMT" fontSize:16];
    label.positionType = CCPositionTypeNormalized;
    label.position = (CGPoint){0.5, 0.25};
    [self addChild:label];
    
    // done
     
     */
    
    return self;
}

-(CCSprite *)background {
    if (!_background) {
        CGSize size = [[CCDirector sharedDirector] viewSize];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            //_background = [CCSprite spriteWithImageNamed:@"Default@2x.png"];
            _background = [CCSprite spriteWithImageNamed:@"Default.png"];
            _background.scale = 0.5;
        } else {
            _background = [CCSprite spriteWithImageNamed:@"Default-Landscape~ipad.png"];
        }
        _background.position = ccp(size.width/2, size.height/2);
    }
    
    return _background;
}

-(void) onEnter {
    [super onEnter];
    
    [[CCDirector sharedDirector] replaceScene:[TitleScreenNode scene]
                               withTransition:[CCDefaultTransition transitionFadeWithDuration:2.0]];
}

@end
