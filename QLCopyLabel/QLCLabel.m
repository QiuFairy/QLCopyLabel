//
//  QLCLabel.m
//  CopyLabel
//
//  Created by qiu on 15/12/4.
//  Copyright © 2015年 qiu. All rights reserved.
//

#import "QLCLabel.h"

@implementation QLCLabel

//为了能接收到事件（能成为第一响应者），我们需要覆盖一个方法：

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

//还需要针对复制的操作覆盖两个方法：
// 可以响应的方法

/**
 *  @author QiuFairy, 16-05-05 11:05:20
 *
 *  此处若不加处理，将会出现系统的“copy”字样
 *
 */
//-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
//{
//    if (action == @selector(cut:)){
//        return (action == @selector(cutFuck:));
//    }else {
//         return (action == @selector(copyFuck:));
//    }
//}

//针对于响应方法的实现

-(void)copyFuck:(id)sender
{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
}
//剪切
-(void)cutFuck:(id)sender
{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
    self.text = @"";
}

//有了以上三个方法，我们就能处理copy了，当然，在能接收到事件的情况下：
//UILabel默认是不接收事件的，我们需要自己添加touch事件

-(void)attachTapHandler
{
    //双击
//    self.userInteractionEnabled = YES;  //用户交互的总开关
//    UITapGestureRecognizer *touch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
//    touch.numberOfTapsRequired = 2;
//    [self addGestureRecognizer:touch];
    
    //长按
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *touch = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:touch];
}

//绑定事件

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self attachTapHandler];
    }
    return self;
}

//同上

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self attachTapHandler];
}

//我们已经可以接收到事件了！由于我在上方将tap数设为2，所以需要双击才能捕获，
//接下来，我们需要处理这个tap，以便让菜单栏弹出来：

-(void)handleTap:(UIGestureRecognizer*) recognizer
{
    [self becomeFirstResponder];
    UIMenuItem *copyLink = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyFuck:)];
    UIMenuItem *cutLink = [[UIMenuItem alloc] initWithTitle:@"剪切" action:@selector(cutFuck:)];
    UIMenuItem *copyLink1 = [[UIMenuItem alloc] initWithTitle:@"分享" action:@selector(copyFuck:)];
//    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:copyLink, nil]];
    [UIMenuController sharedMenuController].menuItems = @[copyLink,cutLink,copyLink1];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated: YES];
    
}
@end
