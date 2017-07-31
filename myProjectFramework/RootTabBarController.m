//
//  RootTabBarController.m
//  myProjectFramework
//
//  Created by NewBest_RD on 2017/7/28.
//  Copyright © 2017年 Jerry. All rights reserved.
//

#import "RootTabBarController.h"
#import "RootNavigationController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self SetTitlesFontAndColour];
    
}

-(void)SetTitlesFontAndColour{
    self.tabBar.barTintColor=[UIColor whiteColor];
    //设置文字大小和颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:11],NSFontAttributeName,[UIColor colorWithRed:44/255.0 green:185/255.0 blue:176/255.0 alpha:1],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:11],NSFontAttributeName,[UIColor colorWithRed:44/255.0 green:185/255.0 blue:176/255.0 alpha:1],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];


    [self setAllSubCiewControllers];


}

-(void)setAllSubCiewControllers{

    NSArray * titleArr=@[@"1",@"2",@"3",@"4"];
    NSArray * imageArr=@[@"normal",@"normal",@"normal",@"normal"];
    NSArray * selectImageArr=@[@"selected",@"selected",@"selected",@"selected"];
    
    //第三级控制器
    FirstViewController * first=[[FirstViewController alloc]init];
    SecondViewController * Second=[[SecondViewController alloc]init];
    ThreeViewController * Three=[[ThreeViewController alloc]init];
    FourViewController * Four=[[FourViewController alloc]init];
    //创建数组
    NSArray *VCArr = @[first,Second,Three,Four];
    NSMutableArray * SubviewArr=[[NSMutableArray alloc]init];
//    for (int i=0; i<VCArr.count; i++) {
//        UIViewController * viewcontroller=VCArr[i];
//        viewcontroller.tabBarItem=[self setTitle:titleArr[i] imageName:imageArr[i] selectedImageName:selectImageArr[i]];
//        [SubviewArr addObject:viewcontroller];
//    }
//    self.viewControllers=SubviewArr;
    

    for (int i=0; i<VCArr.count; i++) {
        RootNavigationController * nav=[[RootNavigationController alloc]initWithRootViewController:VCArr[i]];
        nav.tabBarItem=[self setTitle:titleArr[i] imageName:imageArr[i] selectedImageName:selectImageArr[i]];
        UIViewController * viewController=VCArr[i];
        viewController.title=titleArr[i];
        [SubviewArr addObject:nav];
    }
    self.viewControllers=SubviewArr;
    
}

-(UITabBarItem *)setTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectImageName{

    UIImage * image=[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * selectImage=[[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem * item=[[UITabBarItem alloc]initWithTitle:title image:image selectedImage:selectImage];

    return item;


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
