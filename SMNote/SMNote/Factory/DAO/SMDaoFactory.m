//
//  SMDaoFactory.m
//  SMNote
//
//  Created by SimonMiao on 16/8/10.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMDaoFactory.h"
#import "SMNoteFolderLogicDaoImpl.h"
#import "SMNoteMemoLogicDaoImpl.h"
#import "SMNoteTrashFolderLogicDaoImpl.h"

@interface SMDaoFactory ()

@property (nonatomic, assign) BOOL bInited;
@property (nonatomic, strong) YTKKeyValueStore *keyValueStore;

@property (nonatomic, strong) SMNoteFolderLogicDaoImpl *folderDaoImpl;
@property (nonatomic, strong) SMNoteMemoLogicDaoImpl *memoDaoImpl;
@property (nonatomic, strong) SMNoteTrashFolderLogicDaoImpl *trashFolderDaoImpl;

@end

@implementation SMDaoFactory

SMSingletonM(DaoFactory)

- (instancetype)init {
    self = [super init];
    if (self) {
        ATLog(@"#####单例初始化啦#####");
        self.bInited = NO;
        
        [self initDBWithUid:@123];
    }
    
    return self;
}

- (BOOL)initDBWithUid:(NSNumber *)uid {
    if (self.bInited) {
        return YES;
    }
//    NSString* newDBPath = [[NSString alloc] initWithFormat:@"%@/Documents", NSHomeDirectory()];
//    ATLog(@"newDBPath:%@",newDBPath);
    self.keyValueStore = [[YTKKeyValueStore alloc] initDBWithName:[NSString stringWithFormat:@"%@.db",uid.stringValue]];
    
    self.bInited = YES;
    
    return YES;
}

- (YTKKeyValueStore *)getKeyValueStore {
    return self.keyValueStore;
}

- (id<SMNoteFolderLogicDaoProtocol>)getFolderDao {
    return self.folderDaoImpl;
}

- (id<SMNoteMemoLogicDaoProtocol>)getMemoDao {
    return self.memoDaoImpl;
}

- (id<SMNoteTrashFolderLogicDaoProtocol>)getTrashFolderDao {
    return self.trashFolderDaoImpl;
}

#pragma mark - DaoImpl对象 懒加载
- (SMNoteFolderLogicDaoImpl *)folderDaoImpl {
    if (!_folderDaoImpl) {
        _folderDaoImpl = [[SMNoteFolderLogicDaoImpl alloc] init];
    }
    
    return _folderDaoImpl;
}

- (SMNoteMemoLogicDaoImpl *)memoDaoImpl {
    if (!_memoDaoImpl) {
        _memoDaoImpl = [[SMNoteMemoLogicDaoImpl alloc] init];
    }
    
    return _memoDaoImpl;
}

- (SMNoteTrashFolderLogicDaoImpl *)trashFolderDaoImpl {
    if (!_trashFolderDaoImpl) {
        _trashFolderDaoImpl = [[SMNoteTrashFolderLogicDaoImpl alloc] init];
    }
    
    return _trashFolderDaoImpl;
}

@end
