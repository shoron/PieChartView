//
//  ViewController.m
//  PieChartView
//
//  Created by shoron on 16/1/4.
//  Copyright © 2016年 yushouren. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet SRPieChartView *pieChartView;
@property (strong, nonatomic) NSMutableArray *randomNumbers;
@property (assign, nonatomic) NSUInteger numbersSum;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupPieChartView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupPieChartView {
    self.pieChartView.selectEnable = YES;
    self.pieChartView.isRingStyle = YES;
    self.pieChartView.showPercentage = YES;
    [self randomPieChartViewDataSource];
}

#pragma mark - Button Handler

- (IBAction)randomPieChartViewDataSource:(id)sender {
    [self randomPieChartViewDataSource];
}

- (IBAction)ringStyleSwitchValueChanged:(id)sender {
    self.pieChartView.isRingStyle = ((UISwitch *)sender).isOn;
    [self.pieChartView reloadData];
}

- (IBAction)selectEnableSwitchValueChanged:(id)sender {
    self.pieChartView.selectEnable = ((UISwitch *)sender).isOn;
}

- (IBAction)showPercentageSwitchValueChanged:(id)sender {
    self.pieChartView.showPercentage = ((UISwitch *)sender).isOn;
}

- (void)randomPieChartViewDataSource {
    if (self.randomNumbers.count > 0) {
        [self.randomNumbers removeAllObjects];
    }
    NSUInteger totalNumberCount = arc4random() % 10;
    if (totalNumberCount < 3) {
        totalNumberCount = 3;
    }
    self.numbersSum = 0;
    for (NSUInteger i = 0; i < totalNumberCount; i++) {
        NSUInteger number = arc4random() % 100;
        self.numbersSum += number;
        [self.randomNumbers addObject:[NSNumber numberWithInteger:number]];
    }
    
    [self.pieChartView reloadData];
}

#pragma mark - SRPieChartViewDataSource

- (NSUInteger)numberOfPartsInPieChartView {
    return self.randomNumbers.count;
}

- (CGFloat)pieChartView:(SRPieChartView *)pieChartView percentageAtPartIndex:(NSUInteger)partIndex {
    return ([self.randomNumbers[partIndex] integerValue] * 1.0) / self.numbersSum;
}

- (UIColor *)pieChartView:(SRPieChartView *)pieChartView colorAtPartIndex:(NSUInteger)partIndex {
    CGFloat red = (arc4random() % 256) / 256.0;
    CGFloat green = (arc4random() % 256) / 256.0;
    CGFloat blue = (arc4random() % 256) / 256.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

//- (CGFloat)startAngleForPieChartView {
//    
//}

#pragma mark - SRPieChartViewDelegate

- (void)pieChartView:(SRPieChartView *)pieChartView willSelectedPartAtIndex:(NSUInteger)index {
    NSLog(@"pieChartView: will Select Part Index:%ld",index);
}

- (void)pieChartView:(SRPieChartView *)pieChartView didSelectedPartAtIndex:(NSUInteger)index {
    NSLog(@"pieChartView: did Select Part Index:%ld",index);
}

#pragma mark - Getters && Setters

- (NSMutableArray *)randomNumbers {
    if (!_randomNumbers) {
        _randomNumbers = [[NSMutableArray alloc] init];
    }
    return _randomNumbers;
}

@end
