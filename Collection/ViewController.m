//
//  ViewController.m
//  Collection
//
//  Created by MAEDA HAJIME on 2014/03/24.
//  Copyright (c) 2014年 MAEDA HAJIME. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 配列[プリミティブボタン]ボタンを押した時
- (IBAction)proc01:(id)sender {
    
    // 配列作成
    int arr[] = {10, 20, 30, 40, 50};
    
    // 配列作成（別記１）
//   int arr[3] = {10, 20, 30};
    
    // 配列作成（別記２）
//   int arr[3];
//   arr[0] = 10;
//   arr[1] = 20;
//   arr[2] = 30;
    
    // 要素数の取得 サイズの計算をして求める　20バイト数　/ 4バイト数 配列の数：5個
    int cnt = sizeof(arr) / sizeof(arr[0]);
    
    NSLog(@"arr:%ld", sizeof(arr));
    NSLog(@"arr:%ld", sizeof(arr[0]));
    
    // 値を取得
    for (int i = 0; i < cnt; i++) {
        NSLog(@"%d", arr[i]);
    }
}

// 配列[クラス]ボタンを押した時
- (IBAction)proc02:(id)sender {
    
    NSString *arr[] = {@"あいうえお", @"かきくけこ"};
    
    // 要素数の取得 サイズの計算をして求める ポインター変数のサイズ
    int cnt = sizeof(arr) / sizeof(arr[0]);
    
    // 値を取得
    for (int i = 0; i < cnt; i++) {
        NSLog(@"%@", arr[i]);
    }
}

//コレクションクラス(NSArray)[Normal]ボタンを押した時
- (IBAction)proc03:(id)sender {
    
    // オブジェクト生成
//  NSArray *arr = [NSArray arrayWithObjects:
//                     @"1st", @"2nd",@"3rd", nil];
    
    // 近代的な書き方
    NSArray *arr = @[@"1stだだ", @"2nd",@"3rd"];
    
//  // 要素数の取得 メソッド形式　int 32ビット型
//  int cnt = [arr count];
    
    // 要素数の取得 メソッド形式 64ビット型　32ビット型　両方OK
    NSUInteger cnt = [arr count];

    // 値の取得 int 32ビット型
//  for (int i = 0; i < cnt; i++) {
//       NSString *val = [arr objectAtIndex:i];
//       NSLog(@"%@", val);
//   }
    
    // 値の取得 NSUInteger 64ビット型　32ビット型　両方OK
    // （個別取得）
    for (NSUInteger i = 0; i < cnt; i++) {
        
//      NSString *val = [arr objectAtIndex:i];
        NSString *val = arr[i];
        NSLog(@"個別取得:%@", val);
    }
    
    // 値の取得（簡易取得）
    NSLog(@"簡易取得:%@", arr);
    
    // 値の取得（高速列挙取得）
    // データの最後まで読み込む
    for (NSString *val in arr) {
        
        NSLog(@"高速列挙取得:%@", val);
    }
    
}

//コレクションクラス(NSArray)[Mutable]ボタンを押した時
- (IBAction)proc04:(id)sender {
    
    // オブジェクト生成
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:
                           @"1st", @"2nd",@"3rd" , nil];
    
    NSLog(@"Mutable取得:%@", arr);
    
    // 要素の追加
    [arr addObject:@"4th"];
    NSLog(@"追加:%@", arr);
    
    // 要素の置換
    [arr replaceObjectAtIndex:1
                   withObject:@"2nd2nd"];
    NSLog(@"置換:%@", arr);
    
    // 要素の挿入
    [arr insertObject:@"2nd" atIndex:1];
    NSLog(@"挿入:%@", arr);
    
    // 要素の削除
    [arr removeObjectAtIndex:2];
    NSLog(@"削除:%@", arr);
    
    // 要素の全削除
    [arr removeAllObjects];
    NSLog(@"全削除:%@", arr);

}

// コレクションクラス(NSDictionary)ボタンを押した時
- (IBAction)proc05:(id)sender {
    
    // オブジェクト生成
//  NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
//                         @"1st", @"key01",
//                         @"2nd", @"key02",
//                         @"3rd", @"key03",
//                         nil];
    
    NSDictionary *dic = @{
                          @"key01": @"1st",
                          @"key02": @"2nd",
                          @"key03": @"3rd",
                          };
    
    // 要素数の取得（個別取得）
    NSUInteger cnt = [dic count];
    
    // 値の取得
    for (NSInteger i; i < cnt; i++) {
        
        NSString *key = [[dic allKeys] objectAtIndex:i];
        NSString *val = [[dic allValues] objectAtIndex:i];
        NSLog(@"個別取得:%@,%@", key, val);
        
    }
    
    // 要素数の取得（キー指定取得）
    // {}for文と同じでローカル記述になる。
    {
//      NSString *val = [dic objectForKey:@"key02"];
        NSString *val = dic[@"key02"];
        NSLog(@"キー指定取得:%@", val);
    }
    
    // 要素数の取得（簡易取得）
    NSLog(@"簡易取得:%@", dic);
    
    // 要素数の取得（高速列挙取得）
    // データの最後まで読み込む
    for (NSString *key in dic) {
        NSLog(@"高速列挙取得:%@, %@", key, dic[key]);
    }
}

// コレクションクラス(NSDictionary)ボタンを押した時
- (IBAction)proc06:(id)sender {
    
    // オブジェクト生成
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                @"1st", @"key01",
                                @"2nd", @"key02",
                                @"3rd", @"key03",
                                nil];
    NSLog(@"生成：%@", dic);
    
    // 要素の追加、置換
    [dic setObject:@"4th" forKey:@"key04"];
    [dic setObject:@"2nd2nd" forKey:@"key02"];
    NSLog(@"追加、置換：%@", dic);
    
    // 要素の挿入
    // なし　（挿入の順番は保持されないから）こことここの間の挿入はありません。
    // キーの値がユニークで順番は関係なし
    
    // 要素の削除
    [dic removeObjectForKey:@"key02"];
    NSLog(@"削除：%@", dic);
    
    // 要素の全削除
    [dic removeAllObjects];
    NSLog(@"全削除：%@", dic);
    
}

// コレクションクラス応用（ラッパー）ボタンを押した時
- (IBAction)proc07:(id)sender {
    
    // NSNumberでラッピングする事により
    // プリミティブ
    // オブジェクトとして扱える
//  NSNumber *num01 = [NSNumber numberWithInt:10];
    NSNumber *num01 = @10;
    NSNumber *num02 = @20;
    
    NSArray *arr = @[num01, num02];
    NSLog(@"%@", arr);
    
    int val01 = [arr[0] integerValue];
    NSLog(@"%d", val01);
    
}

@end
