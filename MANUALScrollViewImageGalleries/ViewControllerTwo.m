//
//  ViewControllerTwo.m
//  MANUALScrollViewImageGalleries
//
//  Created by Kevin Cleathero on 2017-06-12.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "ViewControllerTwo.h"

@interface ViewControllerTwo ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollVar;

@property (nonatomic) UIImageView *image;

@end

@implementation ViewControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.image = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.image.translatesAutoresizingMaskIntoConstraints = NO;
    self.image.image = [UIImage imageNamed:@"Lighthouse-zoomed.jpg"];
    
    [self.scrollVar addSubview:self.image];
    
    //imageview lleft side (anchor) we want it to be equal to the scrollviews leading "left"side
    NSLayoutConstraint * leading = [self.image.leadingAnchor constraintEqualToAnchor:self.scrollVar.leadingAnchor];
    
    NSLayoutConstraint * top = [self.image.topAnchor constraintEqualToAnchor:self.scrollVar.topAnchor];
    
    NSLayoutConstraint * bottom = [self.image.bottomAnchor constraintEqualToAnchor:self.scrollVar.bottomAnchor];
    
    NSLayoutConstraint * trailing = [self.image.trailingAnchor constraintEqualToAnchor:self.scrollVar.trailingAnchor];
    
    [self.image.superview addConstraints:@[leading, top, bottom, trailing]];
    
    self.scrollVar.minimumZoomScale = 1;
    self.scrollVar.maximumZoomScale = 3;
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return self.image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
