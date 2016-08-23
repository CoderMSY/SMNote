//
//  SMNoteDetailController.m
//  SMNote
//
//  Created by SimonMiao on 16/8/11.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteDetailController.h"
#import <Masonry/Masonry.h>
#import "UIViewController+BackButtonHandler.h"
#import "SMNoteDetailView.h"

#import "SMDaoFactory.h"
#import "SMNoteDetailModel.h"

@interface SMNoteDetailController () <SMNoteDetailViewDelegate>

@property (nonatomic, strong) SMNoteDetailView *detailView;

@property (nonatomic, strong) UIBarButtonItem *actionItem;
@property (nonatomic, strong) UIBarButtonItem *doneItem;

@end

@implementation SMNoteDetailController

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    // setup a list of preview actions
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Aciton1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        ATLog(@"Aciton1");
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"Aciton2" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        ATLog(@"Aciton2");
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"Aciton3" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        ATLog(@"Aciton3");
    }];
    
    NSArray *actions = @[action1,action2,action3];
    
    // and return them (return the array of actions instead to see all items ungrouped)
    return actions;
}

- (BOOL)navigationShouldPopOnBackButton {
    [self.detailView resignKeyboard];
    
    ATLog(@"测试运行到哪里了");
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailView = [[SMNoteDetailView alloc] init];
    self.detailView.delegate = self;
    self.detailView.detailModel = self.detailModel;
    [self.view addSubview:self.detailView];
    
    [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(self.view);
    }];
    
    [self createRightItems];
    [self addDefualtObserver];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.opaque = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.opaque = YES;
}

- (void)createRightItems {
    self.actionItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionItemClicked)];
    self.doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneItemClicked)];
    self.navigationItem.rightBarButtonItems = @[self.actionItem];
}

- (void)addDefualtObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)actionItemClicked {
    ATLog(@"分享啦");
}

- (void)doneItemClicked {
    [self.detailView resignKeyboard];
}

- (void)keyboardShow:(NSNotification *)sender
{
    //获取键盘高度
    NSDictionary *dict=[sender userInfo];
    NSValue *value=[dict objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardrect = [value CGRectValue];
    CGFloat height=keyboardrect.size.height;
    [self.detailView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).offset(- height);
    }];
}

- (void)keyboardHide:(NSNotification *)sender
{
    [self.detailView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view);
    }];
}

#pragma mark - SMNoteDetailViewDelegate

- (void)smNoteDetailViewDelegateOfBecomeFirstResponder
{
    // 显示完成按钮
    self.navigationItem.rightBarButtonItems = @[self.doneItem,self.actionItem];
}

- (void)smNoteDetailViewDelegateOfResignFirstResponder:(SMNoteDetailModel *)model
{
    //注销键盘后显示转发按钮
    self.navigationItem.rightBarButtonItems = @[self.actionItem];
    model.order = self.foldOrder;
    if (model.contentStr.length) {
        if (0 == model.order.integerValue) {
            [[_Dao getTrashFolderDao] saveTrashMemos:@[model]];
#warning 在废纸篓中新增的备忘录暂时放在废纸篓表中，下次再转到固定的note表中
        } else {
            [[_Dao getMemoDao] insertMemo:model async:YES];
        }
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self resignFirstResponder];
    [Notif removeObserver:self];
}

@end
