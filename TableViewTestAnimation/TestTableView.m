//
//  TestTableView.m
//  TableViewTestAnimation
//
//  Created by 童星 on 16/6/16.
//  Copyright © 2016年 童星. All rights reserved.
//

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#import "TestTableView.h"
#import "TestTableViewCell.h"
@interface TestTableView ()
@property (nonatomic, strong) UIView *testView;
@property (nonatomic, assign, getter = isVisiable) BOOL visiable;
@property (nonatomic, strong) NSArray *Harray;
@property (nonatomic, assign, getter = isSelf_adaption) BOOL self_adaption;
@property (nonatomic, assign) int index_arr;
@property (nonatomic, strong) NSIndexPath* indexPath_cell;
@end

@implementation TestTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.Harray = [NSArray arrayWithObjects:@200,@300, @250, @350, @300,@500, nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TestTableViewCell *cell = [TestTableViewCell cellWithTableView:tableView];
    
   
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (self.isSelf_adaption && [indexPath isEqual:_indexPath_cell]) {
        return [[_Harray objectAtIndex:_index_arr] intValue];
        
    }else{
        if (indexPath.row == 0) return 100;
        else if (indexPath.row == 1) return 200;
        else if (indexPath.row == 2)  return 250;
        else if (indexPath.row == 3) return 300;
        else if (indexPath.row == 4) return 350;
        else return 200;

    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    TestTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (!self.isVisiable) {
        _index_arr = arc4random()%5;
        _indexPath_cell = indexPath;
        _self_adaption = YES;
        CGFloat f = [[_Harray objectAtIndex:_index_arr] floatValue];
        UIView *testView = [[UIView alloc]
                            initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, f - 10)];
        testView.backgroundColor = [UIColor colorWithRed:1.000 green:0.971 blue:0.138 alpha:1.000];
        testView.userInteractionEnabled = NO;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:testView.bounds];
        imageView.image = [UIImage imageNamed:@"ab97283425c2ce1c75ccac15a1fed5fd.jpg"];
        [testView addSubview:imageView];
        _testView= testView;
        [cell.contentView addSubview:testView];
        
        [tableView beginUpdates];
        testView.transform = CGAffineTransformMakeScale(1, 0.01);
        
        [UIView animateWithDuration:0.5
                         animations:^{
                             
                             testView.transform = CGAffineTransformMakeScale(1, 1);
                             CGRect oldFrame = cell.frame;
                             oldFrame.size.height = f;
                             cell.frame = oldFrame;

                         }completion:^(BOOL finish){
                             _visiable = YES;

                         }];
        [tableView endUpdates];
        
    }
    else{
    
        [UIView animateWithDuration:0.5
                         animations:^{
                             
                             _testView.transform = CGAffineTransformMakeScale(1, 0.01);
                             
                         }completion:^(BOOL finish){
                             [_testView removeFromSuperview];
                             _visiable = NO;
                             _self_adaption = NO;

                             [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                         }];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
