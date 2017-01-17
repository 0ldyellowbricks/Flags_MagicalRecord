//
//  AddInfoViewController.m
//  Flags
//
//  Created by Frayda on 14/1/17.
//  Copyright © 2017 flas. All rights reserved.
//

#import "AddInfoViewController.h"
#import "InfoView.h"
#import "AddInfoVM.h"
#import <Masonry/Masonry.h>

@interface AddInfoViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *list;
    NSArray *imageArray;
    InfoView *infoView;
    NSInteger selectedFlag;
}

@end

@implementation AddInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    imageArray = [[NSArray alloc] initWithObjects:@"australia",@"greece",@"switzerland",@"united_kingdom",@"usa", nil];
    UIButton *backBtn =[UIButton new];
    [self.view addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@20);
        make.width.height.equalTo(@40);
    }];
    [backBtn setTitle:@"Back" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    list = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    list.dataSource = self;
    list.delegate = self;
    [self.view addSubview:list];
    [list mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(@64);
    }];
    infoView = [InfoView new];
    [self.view addSubview:infoView];
    [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.centerX.width.centerY.equalTo(self.view); 
    }];
    infoView.backgroundColor = [UIColor whiteColor];
    infoView.hidden = YES;
    [infoView.finishBtn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
}
- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)btnClicked{
    if (infoView.nameTF.text.length==0 ||infoView.countTF.text.length==0 ) {
        NSLog(@"请填写名字和次数");
    }else{
        [infoView.nameTF resignFirstResponder];
        [infoView.countTF resignFirstResponder];
        infoView.hidden = YES;
        NSMutableDictionary *mDic = [NSMutableDictionary dictionary];
        [mDic setObject:imageArray[selectedFlag] forKey:@"imageStr"];
        [mDic setObject:infoView.nameTF.text forKey:@"nameStr"];
        [mDic setObject:infoView.countTF.text forKey:@"countStr"];
        AddInfoVM *addInfoVM = [[AddInfoVM alloc] init];
        [addInfoVM goback:mDic withVC:self];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return imageArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    UIImageView *flagImage = [UIImageView new];
    [cell.contentView addSubview:flagImage];
    [flagImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.width.height.equalTo(@50);
        make.centerX.equalTo(cell);
    }];
    NSString *imageStr = imageArray[indexPath.row];
    flagImage.image = [UIImage imageNamed:imageStr];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectedFlag = indexPath.row;
    infoView.hidden = NO;
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
