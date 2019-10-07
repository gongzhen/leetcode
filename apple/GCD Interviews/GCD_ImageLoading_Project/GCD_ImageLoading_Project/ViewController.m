//
//  ViewController.m
//  GCD_ImageLoading_Project
//
//  Created by Zhen Gong on 9/7/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
// https://www.cnblogs.com/kenshincui/p/3983982.html
// https://www.cnblogs.com/kenshincui/p/3983982.html

#import "ViewController.h"
#import "GCDImageData.h"

#define ROW_COUNT 5
#define COLUMN_COUNT 3
#define CELL_SPACING 10

@interface ViewController () {
    NSMutableArray <UIImageView *> *_imageViews;

    NSArray<NSString *> *_imageNames;
    NSMutableArray<NSThread *> *_threads;
    
    int _rowWidth;
    int _rowHeight;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _rowWidth = self.view.bounds.size.width / 3.0;
    _rowHeight = _rowWidth;
    [self initImagesUrl];
    [self layoutUI];
}



-(void)layoutUI{
    //创建多个图片控件用于显示图片
    _imageViews=[NSMutableArray array];
    for (int r = 0; r < ROW_COUNT; r++) {
        for (int c = 0; c < COLUMN_COUNT; c++) {
            CGRect rect = CGRectMake(c * _rowWidth + (c * CELL_SPACING), r * _rowHeight + (r * CELL_SPACING                           ), _rowWidth, _rowHeight);
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.view addSubview:imageView];
            [_imageViews addObject:imageView];
        }
    }
    
    //加载按钮
    UIButton *buttonStart=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonStart.frame=CGRectMake(self.view.bounds.size.width / 2 - 220, self.view.bounds.size.height - 100, 220, 25);
    [buttonStart setTitle:@"加载图片" forState:UIControlStateNormal];
    // [buttonStart addTarget:self action:@selector(loadImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [buttonStart addTarget:self action:@selector(loadImageWithOperationQueue) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonStart];
    
    //停止按钮
    UIButton *buttonStop=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonStop.frame = CGRectMake(self.view.bounds.size.width / 2, self.view.bounds.size.height - 100, 220, 25);
    [buttonStop setTitle:@"停止加载" forState:UIControlStateNormal];
    [buttonStop addTarget:self action:@selector(stopLoadImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonStop];
    
    //创建图片链接
}

#pragma mark 将图片显示到界面
-(void)updateImage:(GCDImageData *)imageData{
    UIImage *image = [UIImage imageWithData:imageData.data];
    UIImageView *imageView= _imageViews[imageData.index];
    imageView.image = image;
    UILabel *indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _rowWidth / 4, _rowHeight / 4)];
    [indexLabel setText:[NSString stringWithFormat:@"%d", imageData.index]];
    [imageView addSubview:indexLabel];
}

#pragma mark 请求图片数据
-(NSData *)requestData:(int )index{
    // For operation queue, you can remove these lines to add last Operation to queue.
//    if (index != (ROW_COUNT * COLUMN_COUNT -1)) {
//        [NSThread sleepForTimeInterval:2.0];
//    }
    if (index >= _imageNames.count) {
        return nil;
    }
    NSURL *url = [NSURL URLWithString:_imageNames[index]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    return data;
}

#pragma mark 加载图片
-(void)loadImage:(NSNumber *)index
{
    int i = (int)[index integerValue];
    //NSLog(@"%i",i);//未必按顺序输出
    NSData *data = [self requestData:i];
    //currentThread方法可以取得当前操作线程
    NSLog(@"current thread :%@",[NSThread currentThread]);
    NSThread *currentThread = [NSThread currentThread];
    //如果当前线程处于取消状态，则退出当前线程
    if (currentThread.isCancelled) {
        NSLog(@"thread(%@) will be cancelled!",currentThread);
        [NSThread exit];//取消当前线程
    }
    GCDImageData *imageData = [[GCDImageData alloc] init];
    imageData.index = i;
    imageData.data = data;
    [self performSelectorOnMainThread:@selector(updateImage:) withObject:imageData waitUntilDone:YES];
}

#pragma mark 多线程下载图片
-(void)loadImageWithMultiThread
{
    int count = ROW_COUNT * COLUMN_COUNT;
    _threads = [NSMutableArray arrayWithCapacity:count];
    //创建多个线程用于填充图片
    for (int i = 0; i < count; ++i) {
        // [NSThread detachNewThreadSelector:@selector(loadImage:) toTarget:self withObject:[NSNumber numberWithInt:i]];
        NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(loadImage:) object:[NSNumber numberWithInt:i]];
        thread.name = [NSString stringWithFormat:@"myThread# %i",i];//设置线程名称
        [_threads addObject:thread];
    }
    for (int i = 0; i < count; i++) {
        NSThread *thread = _threads[i];
        [thread start];
    }
}

- (void)loadImageWithOperationQueue
{
    int count = ROW_COUNT * COLUMN_COUNT;
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 5;
    NSBlockOperation *lastBlockOperation = [NSBlockOperation blockOperationWithBlock:^{
        [self loadImage:[NSNumber numberWithInt:(count - 1)]];
    }];
    
    for (int i = 0; i < count - 1; i++) {
        NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
            [self loadImage:[NSNumber numberWithInt:i]];
        }];
        [blockOperation addDependency:lastBlockOperation];
        [queue addOperation:blockOperation];
    }
    
    [queue addOperation:lastBlockOperation];
}

#pragma mark 停止加载图片
-(void)stopLoadImage
{
    for (int i = 0; i < ROW_COUNT*COLUMN_COUNT; i++) {
        NSThread *thread= _threads[i];
        //判断线程是否完成，如果没有完成则设置为取消状态
        //注意设置为取消状态仅仅是改变了线程状态而言，并不能终止线程
        if (!thread.isFinished) {
            [thread cancel];            
        }
    }
}

- (void)initImagesUrl
{
    _imageNames = @[
                    @"https://i.pinimg.com/564x/d6/f8/a6/d6f8a6f52a239729b0bd9fbeb936546d.jpg",
                    @"https://i.pinimg.com/736x/13/30/d0/1330d0f4e6b7cf04a4ad26c619eea8f4.jpg",
                    @"https://i.pinimg.com/originals/3f/be/34/3fbe34324dd78becab2699250d99e1ac.jpg",
                    @"https://i.pinimg.com/1200x/9c/30/83/9c3083a7252b13f96a4f5075f60704e8.jpg",
                    @"https://i.pinimg.com/originals/7b/87/f2/7b87f23c47005456e8bfb068e16b2027.jpg",
                    @"https://www.gormify.com/wp-content/uploads/2019/07/98ed15fac9a9bda5425d372d8a446eb3.jpg",
                    @"https://www.gormify.com/wp-content/uploads/2019/07/8db0d342fd5d1fee7da7d9240f97e7bb.jpg",
                    @"https://www.gormify.com/wp-content/uploads/2019/07/32c2490ad6d452357902106302c039fa.jpg",
                    @"https://www.gormify.com/wp-content/uploads/2019/07/efeb0e043761e82a68d06c990dd48a00.jpg",
                    @"https://www.gormify.com/wp-content/uploads/2019/07/434d4d66e8ae2a685b2003e9c940540b.jpg",
                    @"https://www.gormify.com/wp-content/uploads/2019/07/b32cd03e2448844e93bd0bcc5b427dcb.jpg",
                    @"https://www.gormify.com/wp-content/uploads/2019/07/a457771aedc28031c9abeb2fa1c8f8db.jpg",
                    @"https://www.gormify.com/wp-content/uploads/2019/07/c676cf776b1dc6188d3bedb4de9bd907.jpg",
                    @"https://www.gormify.com/wp-content/uploads/2019/07/13e01cc5aa73d811345850afd07d9664.jpg",
                    @"https://www.gormify.com/wp-content/uploads/2019/07/952d995818174642cf67b162dac54c44.jpg"
                    ];
    
}

// https://www.cnblogs.com/kenshincui/p/3983982.html

@end
