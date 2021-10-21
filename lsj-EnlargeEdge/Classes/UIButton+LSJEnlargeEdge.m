//
//  UIButton+EnlargeEdge.m
//
//  Created by Alex on 2017/3/11.
//

#import "UIButton+LSJEnlargeEdge.h"

@implementation UIButton (LSJEnlargeEdge)

static char topNameKey;
static char leftNameKey;
static char bottomNameKey;
static char rightNameKey;

- (void)lsj_setEnlargeEdge:(CGFloat) size
{
    objc_setAssociatedObject(self, &topNameKey,   [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey,  [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey,[NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)lsj_setEnlargeEdgeWithTop:(CGFloat) top left:(CGFloat) left bottom:(CGFloat) bottom right:(CGFloat) right
{
    objc_setAssociatedObject(self, &topNameKey,   [NSNumber numberWithFloat:top],   OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey,  [NSNumber numberWithFloat:left],  OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey,[NSNumber numberWithFloat:bottom],OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect
{
    // !!!: 遵循 iOS (hidden = true || alpha = 0) 时，是无法点击的
    if(self.hidden || self.alpha == 0){
        return self.bounds;
    }else{
        NSNumber* topEdge    = objc_getAssociatedObject(self, &topNameKey);
        NSNumber* rightEdge  = objc_getAssociatedObject(self, &rightNameKey);
        NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
        NSNumber* leftEdge   = objc_getAssociatedObject(self, &leftNameKey);
        
        if (topEdge && rightEdge && bottomEdge && leftEdge)
        {
            return CGRectMake(self.bounds.origin.x    - leftEdge.floatValue,
                              self.bounds.origin.y    - topEdge.floatValue,
                              self.bounds.size.width  + leftEdge.floatValue + rightEdge.floatValue,
                              self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
            
        } else
        {
            return self.bounds;
        }
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect rect = [self enlargedRect];
    
    if (CGRectEqualToRect(rect, self.bounds) && [self.class isEqual:[UIButton class]])
    {
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? YES : NO;
}

//- (UIView*)hitTest:(CGPoint) point withEvent:(UIEvent*) event
//{
//    // !!!: 问题一： 将这个扩展改成 UIView 的时候，这里无法被触发
//    // !!!: 问题二： UIButton addTarget TouUpInsert 范围内，却没有触发事件
//    // !!!: 只有通过 addGestureTap 手势的时候才正常
//
//    CGRect rect = [self enlargedRect];
//    CGRect bounds = self.bounds;
//    if (CGRectEqualToRect(rect, self.bounds))
//    {
//        if(self.tag == 999){
//            NSLog(@"CGRectEqualToRect(rect, self.bounds) - %@",[super hitTest:point withEvent:event]);
//        }
//        return [super hitTest:point withEvent:event];
//    }
//
//    UIView *result = CGRectContainsPoint(rect, point) ? self : nil;
//    if(self.tag == 999){
//        NSLog(@"%@",result);
//    }
//    return result;
//}


@end
