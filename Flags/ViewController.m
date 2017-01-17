//
//  ViewController.m
//  Flags
//
//  Created by Frayda on 13/1/17.
//  Copyright © 2017 flas. All rights reserved.
//

#import "ViewController.h"
#import "AddInfoViewController.h"
#import "FlagInfo+CoreDataClass.h"
#import "Flag+CoreDataClass.h"
#import <MagicalRecord/MagicalRecord.h>
#import <Masonry/Masonry.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *list;
    NSMutableArray *dataArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:0.87 green:0.87 blue:0.88 alpha:1.00];
    dataArray = [NSMutableArray array];
    UIButton *addBtn =[UIButton new];
    [self.view addSubview:addBtn];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.width.height.equalTo(@50);
        make.right.equalTo(self.view).offset(-20);
    }];
    [addBtn setTitle:@"Add" forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal]; 
    [addBtn addTarget:self action:@selector(gotoNewVC) forControlEvents:UIControlEventTouchUpInside];
    UIButton *clearAllBtn =[UIButton new];
    [self.view addSubview:clearAllBtn];
    [clearAllBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.width.height.equalTo(@40);
        make.left.equalTo(self.view).offset(20);
    }];
    [clearAllBtn setTitle:@"clear" forState:UIControlStateNormal];
    [clearAllBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [clearAllBtn addTarget:self action:@selector(clearAllBtn) forControlEvents:UIControlEventTouchUpInside];
    list = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    list.dataSource = self;
    list.delegate = self;
    [self.view addSubview:list];
    [list mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(@64);
    }];
}
- (void)viewWillAppear:(BOOL)animated{
    [self checkFlagData];
}
- (void)checkFlagData{
    [dataArray removeAllObjects];
    NSArray *all = [Flag MR_findAll];
    for (int i = 0; i<all.count; i++) {
        Flag *flag = all[i];
        [dataArray addObject:flag];
    }
    [list reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Flag *ff = dataArray[indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    UIImageView *flagImage = [UIImageView new];
    [cell.contentView addSubview:flagImage];
    [flagImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.width.height.equalTo(@50);
        make.left.equalTo(@15);
    }];
    UILabel *nameAndTimesLbl = [UILabel new];
    [cell.contentView addSubview:nameAndTimesLbl];
    [nameAndTimesLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(flagImage.mas_right).offset(20);
        make.centerY.equalTo(cell.contentView);
        make.width.equalTo(@180);
        make.height.equalTo(@30);
    }];
    nameAndTimesLbl.font = [UIFont systemFontOfSize:15];
    nameAndTimesLbl.textColor = [UIColor lightGrayColor];
    nameAndTimesLbl.textAlignment = NSTextAlignmentCenter;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (ff.name.length>0) {
        NSString *imageStr = ff.flagInfo.describtion;
        flagImage.image = [UIImage imageNamed:imageStr];
        nameAndTimesLbl.text = [NSString stringWithFormat:@"%@ 一共去过 %i 次",ff.name,ff.flagInfo.travelTimes];
    }else{
        flagImage.hidden = YES;
        nameAndTimesLbl.hidden = YES;
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) { 
        Flag *flag2Delete = dataArray[indexPath.row];
        [flag2Delete MR_deleteEntity];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError * _Nullable error) {
            if (!error) {
                [self checkFlagData];
            } else {
                NSLog(@"%@", error);
            }
        }];
    }
}

- (void)gotoNewVC{
    AddInfoViewController *vc = [[AddInfoViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)clearAllBtn{
    if (dataArray.count>0) {
        // 清除所有数据
        [Flag MR_truncateAll];
        [self checkFlagData];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
