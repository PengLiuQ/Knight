//
//  Draw.m
//  HomeWork_1
//
//  Created by tens04 on 16/8/29.
//  Copyright © 2016年 xuan. All rights reserved.
//

#import "Draw.h"

@implementation Draw

- (void)drawRect:(CGRect)rect {
//    
//    [self drawTian];
//    [self drawGu];
    
//    [self drawArc];
    [self drawArce];
//    [self drawBezierPaths];
}

- (void)drawTian {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 100)];
    int x = 0;
    int y = 200;
    
    for (int i = 0; i < 7; i++) {
        x += 50;
        y = arc4random()%100;
        [path addLineToPoint:CGPointMake(x, y)];
    }
    
    [path setLineWidth:2];
    [path setLineCapStyle:kCGLineCapRound];
    [path setLineJoinStyle:kCGLineJoinMiter];
    
    [[UIColor redColor] setStroke];
    [path stroke];
}

- (void)drawGu {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 300)];
    int x = 0;
    int y;
    
    for (int i = 0; i < 50; i++) {
        x += 10;
        y = (arc4random()%250)+300;
        
        [path addLineToPoint:CGPointMake(x, y)];
    }
    [path setLineWidth:2];
    [path setLineCapStyle:kCGLineCapRound];
    [path setLineJoinStyle:kCGLineJoinMiter];
    
    [[UIColor blueColor] setStroke];
    [path stroke];

}
- (void)drawArc {
    
    CGPoint center = self.center;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:150 startAngle:0 endAngle: M_PI_2 clockwise:YES];
    
    path.lineWidth = 5;
    [path addLineToPoint:center];
    [path closePath];
    
    [[UIColor redColor] setStroke];
    [[UIColor whiteColor] setFill];
    
    [path stroke];
    [path fill];
    
    path = [UIBezierPath bezierPathWithArcCenter:center radius:150 startAngle:0 endAngle: M_PI_2+M_PI clockwise:NO];
    
    path.lineWidth = 5;
    [path addLineToPoint:center];
    [path closePath];
    
    [[UIColor redColor] setStroke];
    [[UIColor blueColor] setFill];
    
    [path stroke];
    [path fill];
    
   
    
    path = [UIBezierPath bezierPathWithArcCenter:center radius:150 startAngle:M_PI_2 endAngle: M_PI clockwise:YES];
    
    path.lineWidth = 5;
    [path addLineToPoint:center];
    [path closePath];
    
    [[UIColor redColor] setStroke];
    [[UIColor orangeColor] setFill];
    
    [path stroke];
    [path fill];
    
    
    path = [UIBezierPath bezierPathWithArcCenter:center radius:150 startAngle:M_PI endAngle:M_PI+M_PI_2  clockwise:YES];
    
    path.lineWidth = 5;
    [path addLineToPoint:center];
    [path closePath];
    
    [[UIColor redColor] setStroke];
    [[UIColor greenColor] setFill];
    
    [path stroke];
    [path fill];


}


- (void)drawBezierPaths {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [[UIColor redColor] setStroke];
    path.lineWidth = 3;
    
    CGFloat screenWidth = CGRectGetWidth(self.bounds);
    CGFloat screenHeight = CGRectGetHeight(self.bounds);
    
    CGFloat width = screenWidth / 10;
    
    for (int i = 0; i < 10; i++) {
        
        CGFloat controlPoint_Y = 0;
        if (i % 2 == 0) {
            
            controlPoint_Y = screenHeight / 2 - 100;
        } else {
            
            controlPoint_Y = screenHeight / 2 + 100;
        }
        
        CGPoint beginPoint = CGPointMake(i * width, screenHeight / 2);
        CGPoint endPoint = CGPointMake(beginPoint.x + width, screenHeight / 2);
        CGPoint controlPoint = CGPointMake((width / 2)+ (i * width), controlPoint_Y);
        
        [path moveToPoint:beginPoint];
        [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    }
    
    [path stroke];
}

- (void)drawArce {
    
    CGPoint center = self.center;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:150 startAngle:0 endAngle: 2*M_PI clockwise:YES];
    
    path.lineWidth = 5;
    [path addLineToPoint:center];
    [path closePath];
    
    
    [[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.3] setFill];
    
    
    [path fill];
   
    
    path = [UIBezierPath bezierPathWithArcCenter:center radius:150 startAngle:M_PI+M_PI_2 endAngle:M_PI_2  clockwise:YES];
    
    path.lineWidth = 3;
    
    
    [[UIColor redColor] setStroke];
    [path stroke];

}





@end
