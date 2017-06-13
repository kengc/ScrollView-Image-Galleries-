//
//  ViewController.m
//  MANUALScrollViewImageGalleries
//
//  Created by Kevin Cleathero on 2017-06-12.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "ViewController.h"

#import "ViewControllerTwo.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollVar;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //bounds.origin.y   //moves content around dont use FRAME
    [self scrollView];
    
}


-(void)scrollView{
    
    
    self.pageControl.numberOfPages = 3;
    
    CGFloat xOrigin = 0;
    self.scrollVar.pagingEnabled = YES;
    
    NSArray *imageViews = [NSArray arrayWithObjects:@"Lighthouse-in-Field.jpg", @"Lighthouse-night.jpg", @"Lighthouse-zoomed.jpg", nil];
    
    for (int i = 0; i < imageViews.count; i++){
        
        //get the SCROLLVIEWs frame size and NOT the base.view.frame since the base.view.frame
        //is bigger than the scrollview
        xOrigin = i * CGRectGetWidth(self.scrollVar.frame);
        
        
        //set to bounds so that it doesnt go up and down x/y
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin, 0, self.scrollVar.bounds.size.width, self.scrollVar.bounds.size.height)];
        image.userInteractionEnabled = true;
        
        
        image.image = [UIImage imageNamed:imageViews[i]];
        image.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.scrollVar addSubview:image];

        UITapGestureRecognizer *TapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
        
        [image addGestureRecognizer:TapGesture];
        
        
    }
    
    //default content which includes height and width...frame of the base view since it makes
    //it too big. Must use scrollview's height and width since it's smaller than self.view.frame.
    self.scrollVar.contentSize = CGSizeMake(imageViews.count * CGRectGetWidth(self.scrollVar.frame), CGRectGetHeight(self.scrollVar.frame));
    
    
//        self.scrollVar.contentSize = CGSizeMake(imageViews.count * CGRectGetWidth(self.scrollVar.bounds), CGRectGetHeight(self.scrollVar.bounds));
}

-(void)viewTap:(UITapGestureRecognizer *)sender {
    
 // [self performSegueWithIdentifier:@"SegueIdentifier" sender:self];
    //if([sender.view isMemberOfClass:<#(__unsafe_unretained Class)#>])
    
    UIImageView *imageView = (UIImageView *)sender.view;
    UIImage *image = imageView.image;

    
    [self performSegueWithIdentifier:@"SegueIdentifier" sender:image];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"SegueIdentifier"]) {
        // Get destination view controller and don't forget
        // to cast it to the right class
        
        UIImage *image = (UIImage *)sender;

        //SecondViewController *secondController = [segue destinationViewController];
        ViewControllerTwo *secondController = [segue destinationViewController];
        // Pass data
        
        secondController.img = image;
        //secondController.name = @"Fancy name";
    }
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat pageWidth = scrollView.frame.size.width; // you need to have a **iVar** with getter for scrollView
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    NSLog(@"page: %ld", (long)page);

    
    
    //self.pageControl.currentPage = lround(fractionalPage); // you need to have a **iVar** with get
    //[self.pageControl setCurrentPage:lround(fractionalPage)]; // you need to have a **iVar** with get

    [self.pageControl setCurrentPage:lround(fractionalPage)];
    NSLog(@"current page: %ld", (long)self.pageControl.currentPage);
    
//    CGFloat width = scrollView.frame.size.width;
//    NSInteger page = (scrollView.contentOffset.x + (0.5f * width)) / width;
//    
//    
//    self.pageControl.currentPage = (int)(scrollView.contentOffset.x / scrollView.frame.size.width);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
