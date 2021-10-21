//
//  UIButton+EnlargeEdge.h
//
//  Created by Alex on 2017/3/11.
//          -  Alex on 2021/3/09.(处理hidden、alpha后还能点击的问题)
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

/// 延伸响应点击范围
@interface UIButton (LSJEnlargeEdge)


/// 同时向按钮的四个方向延伸响应面积
/// @param size 间距
- (void)lsj_setEnlargeEdge:(CGFloat) size;

/// 向按钮的四个方向延伸响应面积
/// @param top 上间距
/// @param left 左间距
/// @param bottom 下间距
/// @param right 右间距
- (void)lsj_setEnlargeEdgeWithTop:(CGFloat) top left:(CGFloat) left bottom:(CGFloat) bottom right:(CGFloat) right;

@end
