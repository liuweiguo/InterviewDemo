//
//  ViewController.m
//  LWGInterviewDemo
//
//  Created by LWG on 2018/7/13.
//  Copyright © 2018年 LWG. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "CustomTableViewCell.h"
#import "AFNetworking.h"
#import "DataModel.h"
#import "MJExtension.h"
#import "MJRefresh.h"

#define URLStr @"http://thoughtworks-ios.herokuapp.com/facts.json"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * table;
@property (nonatomic,strong) NSMutableArray * dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatUI];
}

- (void)requestData{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLStr]];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        [self.table.mj_header endRefreshing];
        if (!error) {
            self.title = [responseObject objectForKey:@"title"];
            self.dataArr = [DataModel mj_objectArrayWithKeyValuesArray:[responseObject objectForKey:@"rows"]];
            [self.table reloadData];
        } else {
            NSLog(@"错误描述: %@", error.description);
        }
    }];
    [dataTask resume];
}
- (void)creatUI{
    self.table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
    self.table.estimatedSectionHeaderHeight = 0;
    self.table.estimatedSectionFooterHeight = 0;
    self.table.estimatedRowHeight = 300;
    self.table.rowHeight = UITableViewAutomaticDimension;
    __weak ViewController * weakSelf = self;
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
    }];
    
    self.table.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestData)];
    [self.table.mj_header beginRefreshing];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * iden = @"customCell";
    CustomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:self options:nil] lastObject];
    }
    if (self.dataArr.count>0) {
        DataModel * model = self.dataArr[indexPath.row];
        [cell addDataWithModel:model];
    }
    return cell;
}

@end
