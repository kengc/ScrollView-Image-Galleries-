//
//  ViewController.m
//  MANUALScrollViewImageGalleries
//
//  Created by Kevin Cleathero on 2017-06-12.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollVar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //bounds.origin.y   //moves content around dont use FRAME
    [self scrollView];
    
}


-(void)scrollView{
    
    CGFloat xOrigin = 0;
    self.scrollVar.pagingEnabled = YES;
    
    NSArray *imageViews = [NSArray arrayWithObjects:@"Lighthouse-in-Field.jpg", @"Lighthouse-night.jpg", @"Lighthouse-zoomed.jpg", nil];
    
    for (int i = 0; i < imageViews.count; i++){
        
        //get the SCROLLVIEWs frame size and NOT the base.view.frame since the base.view.frame
        //is bigger than the scrollview
        xOrigin = i * CGRectGetWidth(self.scrollVar.frame);
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin, 0, self.scrollVar.frame.size.width, self.scrollVar.frame.size.height)];
        
        image.image = [UIImage imageNamed:imageViews[i]];
        image.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.scrollVar addSubview:image];
    }
    
    //default content which includes height and width...frame of the base view since it makes
    //it too big. Must use scrollview's height and width since it's smaller than self.view.frame.
    self.scrollVar.contentSize = CGSizeMake(imageViews.count * CGRectGetWidth(self.scrollVar.frame), CGRectGetHeight(self.scrollVar.frame));
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
