//
//  SRPieChartView.h
//  bzt
//
//  Created by shoron on 15/12/24.
//  Copyright © 2015年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SRPieChartView;

@protocol SRPieChartViewDataSource <NSObject>

@required

/**
 *  饼状图的块的数量
 *
 *  @return 饼状图的块数
 */
- (NSUInteger)numberOfPartsInPieChartView;

/**
 *  返回每个部分所占的百分比
 *
 *  @param pieChartView 饼状图对象
 *  @param partIndex    从起始角度按照顺时针数第几块
 *
 *  @return 该块所占的百分比
 */
- (CGFloat)pieChartView:(SRPieChartView *)pieChartView percentageAtPartIndex:(NSUInteger)partIndex;

@optional

/**
 *  返回每一块的颜色
 *  默认值是黄色
 *
 *  @param pieChartView 饼状图对象
 *  @param partIndex    从起始角度按照顺时针数第几块
 *
 *  @return 该块的填充颜色
 */
- (UIColor *)pieChartView:(SRPieChartView *)pieChartView colorAtPartIndex:(NSUInteger)partIndex;

/**
 *  饼状图开始的角度
 *  返回值的范围是 0 ～ 2 * M_PI
 *  0 指的是水平向右的方向，顺时针依次增加
 *  默认值是0 ～ 2 * M_PI 之间的随机值
 *
 *  @return 饼状图开始的角度。（0 ～ M_PI * 2）
 */
- (CGFloat)startAngleForPieChartView;

@end

@protocol SRPieChartViewDelegate <NSObject>

@optional
/**
 *  当用户点击某一块时调用次方法
 *
 *  @param pieChartView 用户点击的饼状图
 *  @param partIndex    点击的第几块
 */
- (void)pieChartView:(SRPieChartView *)pieChartView didSelectedPartAtIndex:(NSUInteger)index;

/**
 *  用户将要选择某一个块时，调用此方法
 *
 *  @param pieChartView 用户点击的饼状图
 *  @param index        点击的第几块
 */
- (void)pieChartView:(SRPieChartView *)pieChartView willSelectedPartAtIndex:(NSUInteger)index;

@end

@interface SRPieChartView : UIView

@property (weak, nonatomic) IBOutlet id<SRPieChartViewDataSource> dataSource;
@property (weak, nonatomic) IBOutlet id<SRPieChartViewDelegate> delegate;

/**
 *  是否在该块显示所占的百分比
 */
@property (assign, nonatomic) BOOL showPercentage;

/**
 *  当前选中的块
 *  可以代码修改这个值，当用户点击某一块的时候也会自动更新这个值
 *  当 selectedPartIndex == -1 时，表示没有选择任何一块
 */
@property (assign, nonatomic) NSInteger selectedPartIndex;

/**
 *  是否允许用户选择某一块（即是否让某一块突出显示）
 *  如果不允许用户选择，则 PieChartViewDelegate 也不会起作用。
 */
@property (assign, nonatomic) BOOL selectEnable;

/**
 *  如果是 YES, 则绘制圆环样式。反之则绘制圆形。
 */
@property (assign, nonatomic) BOOL isRingStyle;

/**
 *  每次刷新 pieChartView 都要调用 reloadData。
 *  每次 dataSource 中的值改变时，刷新调用reloadData
 */
- (void)reloadData;

@end
