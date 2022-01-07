//
//  ViewController.m
//  JUNCircleProgressView
//
//  Created by 马欣淳 on 2022/1/7.
//

#import "ViewController.h"
#import "JUNCircleProgressView.h"

@interface ViewController ()

@property(weak, nonatomic) JUNCircleProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *targetView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    targetView.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);
    targetView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:targetView];
    
    JUNCircleProgressView *progressView = [[JUNCircleProgressView alloc] initWithFrame:targetView.bounds];
    
    _progressView = progressView;
    [targetView addSubview:progressView];
    
    UISlider *slider = [[UISlider alloc] init];
    slider.maximumValue = 1.0;
    slider.minimumValue = 0;
    [self.view addSubview:slider];
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)sliderValueChanged:(UISlider *)slider {
    _progressView.progress = slider.value;
}


@end
