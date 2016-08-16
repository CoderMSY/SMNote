//
//  SMNoteMemoController.m
//  SMNote
//
//  Created by SimonMiao on 16/8/11.
//  Copyright © 2016年 MSY. All rights reserved.
// 备忘录控制器

#import "SMNoteMemoController.h"
#import "SMNoteMemoView.h"
#import "SMNoteMemoBottomView.h"
#import "SMNoteMemoAdapter.h"
#import "SMNoteMemoInteractor.h"

#import <Masonry/Masonry.h>
#import "UIViewController+BackButtonHandler.h"

#import "SMNoteFolderModel.h"
#import "SMNoteDetailModel.h"
#import "SMDaoFactory.h"

@interface SMNoteMemoController () <ATTableViewAdapterDelegate>

@property (nonatomic, strong) SMNoteMemoView *menoView;
@property (nonatomic, strong) SMNoteMemoBottomView *bottomView;
@property (nonatomic, strong) SMNoteMemoAdapter *adapter;
@property (nonatomic, strong) SMNoteMemoInteractor *interactor;

@end

@implementation SMNoteMemoController

- (SMNoteMemoInteractor *)interactor {
    if (!_interactor) {
        _interactor = [[SMNoteMemoInteractor alloc] init];
        _interactor.baseController = self;
    }
    
    return _interactor;
}

- (BOOL)navigationShouldPopOnBackButton {
    if (_block) {
        _block(self.adapter.adapterArray.count);
    }
    
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.folderModel.title;
    
    self.menoView = [[SMNoteMemoView alloc] init];
    self.bottomView = [[SMNoteMemoBottomView alloc] init];
    [self.view addSubview:self.menoView];
    [self.view addSubview:self.bottomView];
    
    ATWeakSelf
    [self.menoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(weakSelf.view);
        make.bottom.mas_equalTo(weakSelf.bottomView.mas_top);
    }];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(44);
    }];
    
    self.adapter = [[SMNoteMemoAdapter alloc] init];
    self.adapter.adapterDelegate = self;
    [self.menoView setTableViewAdapter:self.adapter];
    
    [self createRightItem];
    
    
    [self.bottomView menoBottomViewOfBtnClicked:^(SMNoteMemoBottomViewBtnType type) {
        switch (type) {
            case SMNoteMemoBottomViewBtnTypeOfAttachments:
                ATLog(@"附件按钮点击事件");
                break;
            case SMNoteMemoBottomViewBtnTypeOfMove:
            
                break;
            case SMNoteMemoBottomViewBtnTypeOfMoveAll: {
                
                break;
            }
            case SMNoteMemoBottomViewBtnTypeOfCreate:
                [weakSelf.interactor pushToNoteDetailWithFolderOrder:weakSelf.folderModel.order detailCtr:nil];
                break;
            case SMNoteMemoBottomViewBtnTypeOfDelete:{
                [[_Dao getMemoDao] removeMemos:[weakSelf.adapter.deleteArray copy] async:YES];
                [weakSelf.adapter.adapterArray removeObjectsInArray:weakSelf.adapter.deleteArray];
                [weakSelf.menoView refreshTableView];
                weakSelf.bottomView.memoNumber = weakSelf.adapter.adapterArray.count;
                [weakSelf.adapter.deleteArray removeAllObjects];
                if (!weakSelf.adapter.adapterArray.count) {
                    [weakSelf rightItemClicked:weakSelf.navigationItem.rightBarButtonItem];
                }
                break;
            }
            case SMNoteMemoBottomViewBtnTypeOfDeleteAll:{
                UIAlertController *alertCtr = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleCancel handler:nil];
                UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [[_Dao getMemoDao] removeMemos:[weakSelf.adapter.adapterArray copy] async:YES];
                    [weakSelf.adapter.adapterArray removeAllObjects];
                    [weakSelf.menoView refreshTableView];
                    weakSelf.bottomView.memoNumber = weakSelf.adapter.adapterArray.count;
                    [weakSelf rightItemClicked:weakSelf.navigationItem.rightBarButtonItem];
                }];
                [cancelAction setValue:[UIColor at_goldColor] forKey:@"titleTextColor"];
                [sureAction setValue:[UIColor at_redColor] forKey:@"titleTextColor"];
                
                [alertCtr addAction:cancelAction];
                [alertCtr addAction:sureAction];
                [weakSelf presentViewController:alertCtr animated:YES completion:nil];
                break;
            }
            default:
                break;
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadDataSource];
}

- (void)createRightItem {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClicked:)];
    rightItem.tintColor = [UIColor at_goldColor];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)loadDataSource {
    NSMutableArray *dataSource;
    if (0 == self.folderModel.order.integerValue) { //废纸篓
        NSArray *trashs = [[_Dao getTrashFolderDao] loadAllTrashMemosFromDB];
        dataSource = [NSMutableArray arrayWithArray:trashs];
    } else {
        NSArray *memos = [[_Dao getMemoDao] loadAllMemosFromDBWithFolderOrder:self.folderModel.order];
        dataSource = [NSMutableArray arrayWithArray:memos];
    }
    self.adapter.adapterArray = dataSource;
    [self.menoView refreshTableView];
    self.bottomView.memoNumber = self.adapter.adapterArray.count;
    if (!self.adapter.adapterArray.count) {
        self.navigationItem.rightBarButtonItem.enabled = NO;
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor at_colorWithHex:0xD4D4D4];
    } else {
        self.navigationItem.rightBarButtonItem.enabled = YES;
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor at_goldColor];
    }
}

/** adapterArray.count数据源变化必须掉此方法 */
- (void)rightItemClicked:(UIBarButtonItem *)item {
    item.title = self.menoView.dataTableView.editing ? @"编辑" : @"完成";
    [self.adapter.deleteArray removeAllObjects];
    [self.menoView.dataTableView setEditing:!self.menoView.dataTableView.editing animated:YES];
    
    [self.bottomView notifyTheBtnChangeStatus:self.menoView.dataTableView.editing];
    if (self.adapter.adapterArray.count) {
        item.enabled = YES;
        item.tintColor = [UIColor at_goldColor];
    } else {
        item.enabled = NO;
        item.tintColor = [UIColor at_colorWithHex:0xD4D4D4];
    }
}

#pragma mark - ATTableViewAdapterDelegate

- (void)didSelectCellData:(id)cellData index:(NSIndexPath *)indexPath {
    if ([cellData isKindOfClass:[SMNoteDetailModel class]]) {
        if (self.menoView.dataTableView.editing) {
            [self.adapter.deleteArray addObject:self.adapter.adapterArray[indexPath.row]];
            [self.bottomView modifyTheBtnEnabledWithDeleteArrCount:self.adapter.deleteArray.count];
        } else {
            [self.interactor pushToNoteDetailWithFolderOrder:self.folderModel.order detailCtr:cellData];
        }
        
    }
}

- (void)didDeselectCellData:(id)cellData index:(NSIndexPath *)indexPath {
    if ([cellData isKindOfClass:[SMNoteDetailModel class]]) {
        if (self.menoView.dataTableView.editing) {
            [self.adapter.deleteArray removeObject:cellData];
            [self.bottomView modifyTheBtnEnabledWithDeleteArrCount:self.adapter.deleteArray.count];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
