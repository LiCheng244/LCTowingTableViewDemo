//
//  TableViewController.m
//  cell 拖拽排序效果的实现
//
//  Created by LiCheng on 2016/12/30.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

/** 数据 */
@property (nonatomic, strong) NSMutableArray *datas;
/** 编辑按钮 */
@property (nonatomic, strong) UIBarButtonItem *editBtn;
@end

@implementation TableViewController

-(NSMutableArray *)datas{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.datas addObjectsFromArray:@[@"数据1",@"数据2",@"数据3",@"数据4",@"数据5",@"数据6",@"数据7",@"数据8",@"数据9",@"数据10",@"数据11",@"数据12"]];
    
    // 右按钮
    self.editBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:(UIBarButtonItemStyleDone) target:self action:@selector(editBtnClick)];
    self.navigationItem.rightBarButtonItem = self.editBtn;
}

/** 编辑按钮 */
-(void)editBtnClick{
    
    // 改变 tableView 的编辑模式
    BOOL isEdit = !self.tableView.editing;
    
    if (isEdit == YES) {
        [self.editBtn setTitle:@"完成"];
    }else{
        [self.editBtn setTitle:@"编辑"];
    }
    [self.tableView setEditing:isEdit animated:YES];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

/** 选择编辑模式，默认是删除模式 */
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}

/** 当移动了某一行时会触发 */
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    // 取出要移动的数据
    NSString *text = self.datas[sourceIndexPath.row];
    
    // 删除之前的数据
    [self.datas removeObject:text];
    
    // 插入到新的位置
    [self.datas insertObject:text atIndex:destinationIndexPath.row];
}

@end
