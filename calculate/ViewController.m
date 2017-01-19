//
//  ViewController.m
//  calculate
//
//  Created by tongle on 2017/1/17.
//  Copyright © 2017年 tongle. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

{
    NSInteger firstNumber;
    NSInteger secondNumber;
    NSInteger totalNumber;
    BOOL   calculate;
    BOOL   equal;
    char calcultorOperator;
}
@property (nonatomic,strong)UILabel * totalLabel;

@end

@implementation ViewController
static NSString * identifier = @"collectionCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 200,self.view.frame.size.width, self.view.frame.size.height-200 ) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.userInteractionEnabled = YES;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.scrollEnabled = NO;
    [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:identifier];
    calculate = NO;
    equal     = NO;
    [self.view addSubview:collectionView];
    self.view.backgroundColor = [UIColor blackColor];
    
    self.totalLabel  = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    self.totalLabel.font = [UIFont fontWithName:@"Arial" size:70];
    _totalLabel.textColor = [UIColor whiteColor];
    _totalLabel.textAlignment = NSTextAlignmentRight;
    
    [self.view addSubview:_totalLabel];
    NSLog(@"----%c",calcultorOperator);
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell * collectionViewCell =(CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    collectionViewCell.backgroundColor = [UIColor clearColor];
    collectionViewCell.layer.borderColor = [UIColor grayColor].CGColor;
    collectionViewCell.layer.borderWidth = 1;
    [collectionViewCell addUI];

    if (indexPath.row ==0) {
        collectionViewCell.Label.text = @"AC";
    }else if (indexPath.row ==1){
        collectionViewCell.Label.text = @"+/-";
    }else if (indexPath.row ==2){
        collectionViewCell.Label.text = @"%";
    }else if (indexPath.row ==3){
        collectionViewCell.Label.text = @"÷";
        collectionViewCell.Label.textColor = [UIColor whiteColor];
        collectionViewCell.backgroundColor = [UIColor orangeColor];
    }else if (indexPath.row ==4){
        collectionViewCell.Label.text = @"7";
    }else if (indexPath.row ==5){
        collectionViewCell.Label.text = @"8";
    }else if (indexPath.row ==6){
        collectionViewCell.Label.text = @"9";
    }else if (indexPath.row ==7){
        collectionViewCell.Label.text = @"×";
        collectionViewCell.Label.textColor = [UIColor whiteColor];
        collectionViewCell.backgroundColor = [UIColor orangeColor];
    }else if (indexPath.row ==8){
        collectionViewCell.Label.text = @"4";
    }else if (indexPath.row ==9){
        collectionViewCell.Label.text = @"5";
    }else if (indexPath.row ==10){
        collectionViewCell.Label.text = @"6";
    }else if (indexPath.row ==11){
        collectionViewCell.Label.text = @"－";
        collectionViewCell.Label.textColor = [UIColor whiteColor];
        collectionViewCell.backgroundColor = [UIColor orangeColor];
    }else if (indexPath.row ==12){
        collectionViewCell.Label.text = @"1";
    }else if (indexPath.row ==13){
        collectionViewCell.Label.text = @"2";
    }else if (indexPath.row ==14){
        collectionViewCell.Label.text = @"3";
    }else if (indexPath.row ==15){
        collectionViewCell.Label.text = @"＋";
        collectionViewCell.Label.textColor = [UIColor whiteColor];
        collectionViewCell.backgroundColor = [UIColor orangeColor];
    }else if (indexPath.row ==16){
        collectionViewCell.Label.text = @"0";
    }else if (indexPath.row ==17){
        collectionViewCell.Label.text = @"";
    }else if (indexPath.row ==18){
        collectionViewCell.Label.text = @".";
    }else if (indexPath.row ==19){
        collectionViewCell.Label.text = @"＝";
        collectionViewCell.Label.textColor = [UIColor whiteColor];
        collectionViewCell.backgroundColor = [UIColor orangeColor];
    }

    if (indexPath.row == 16||indexPath.row == 17) {
        collectionViewCell.layer.borderWidth = 0;
    }
    
    return collectionViewCell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        calculate = NO;
        firstNumber = 0;
        totalNumber = 0;
        secondNumber = 0;
    }else if (indexPath.row == 1){
        firstNumber = -firstNumber;
        totalNumber = -totalNumber;
    }else if (indexPath.row == 2){
        
    }else if (indexPath.row == 3){
        calculate = YES;
        calcultorOperator = '/';
    }else if (indexPath.row == 4){
        if (calculate) {
            secondNumber = 7;
        }else{
            firstNumber = 7;
        }
    }else if (indexPath.row == 5){
        if (calculate) {
            secondNumber = 8;
        }else{
            firstNumber = 8;
        }
    }else if (indexPath.row == 6){
        if (calculate) {
            secondNumber = 9;
        }else{
            firstNumber = 9;
        }
    }else if (indexPath.row == 7){
        calculate = YES;
        calcultorOperator = '*';
    }else if (indexPath.row == 8){
        if (calculate) {
            secondNumber = 4;
        }else{
            firstNumber = 4;
        }
    }else if (indexPath.row == 9){
        if (calculate) {
            secondNumber = 5;
        }else{
            firstNumber = 5;
        }
    }else if (indexPath.row == 10){
        if (calculate) {
            secondNumber = 6;
        }else{
            firstNumber = 6;
        }
    }else if (indexPath.row == 11){
        calculate = YES;
        calcultorOperator = '-';
    }else if (indexPath.row == 12){
        if (calculate) {
            secondNumber = 1;
        }else{
            firstNumber = 1;
        }
    }else if (indexPath.row == 13){
        if (calculate) {
            secondNumber = 2;
        }else{
            firstNumber = 2;
        }
    }else if (indexPath.row == 14){
        if (calculate) {
            secondNumber = 3;
        }else{
            firstNumber = 3;
        }
    }else if (indexPath.row == 15){
        calculate = YES;
        calcultorOperator = '+';
    }else if (indexPath.row == 16){
        if (calculate) {
            secondNumber = 0;
        }else{
            firstNumber = 0;
        }
    }else if (indexPath.row == 17){
        
    }else if (indexPath.row == 18){
        
    }else if (indexPath.row == 19){
        equal  = YES;
        switch (calcultorOperator) {
            case '/':
                [self div];
                break;
            case '*':
                [self mul];
                break;
            case '+':
                [self add];
                break;
            case '-':
                [self cut];
                break;
                
            default:
                break;
        }
    }
    if (equal) {
        self.totalLabel.text = [NSString stringWithFormat:@"%ld",totalNumber];
        equal = NO;
    }else{
        if (calculate == NO) {
            self.totalLabel.text = [NSString stringWithFormat:@"%ld",firstNumber];
        }else{
            if (secondNumber==0) {
                self.totalLabel.text = [NSString stringWithFormat:@"%ld",firstNumber];
            }else{
                self.totalLabel.text = [NSString stringWithFormat:@"%ld",secondNumber];
            }
            
        }
        
    }

    NSLog(@"%ld,%ld",(long)firstNumber,secondNumber);
    
}
-(NSInteger)div{
    totalNumber =  firstNumber / secondNumber;
    return totalNumber;
}
-(NSInteger)mul{
    totalNumber = firstNumber * secondNumber;
    return totalNumber;
}
-(NSInteger)cut{
    totalNumber = firstNumber - secondNumber;
    return totalNumber;
}
-(NSInteger)add{
    totalNumber = firstNumber + secondNumber;
    return totalNumber;
}
-(void)value{
    
}



//设置每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width/4, self.view.frame.size.width/4);
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
