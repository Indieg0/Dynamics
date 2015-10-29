//
//  ViewController.m
//  DynamicHomework
//
//  Created by Kirill on 29.10.15.
//  Copyright © 2015 Kirill. All rights reserved.
//

#import "ViewController.h"
#import "Students.h"

@interface ViewController () <UITableViewDataSource>

@property (strong, nonatomic) NSArray* arrayOfStudents;
@property (strong, nonatomic) NSMutableArray* arrayOfExcellentStudents;
@property (strong, nonatomic) NSMutableArray* arrayOfGoodStudents;
@property (strong, nonatomic) NSMutableArray* arrayOfBadStudents;


/*
@property (strong, nonatomic) Students* student1;
@property (strong, nonatomic) Students* student2;
@property (strong, nonatomic) Students* student3;
@property (strong, nonatomic) Students* student4;
@property (strong, nonatomic) Students* student5;
@property (strong, nonatomic) Students* student6;
@property (strong, nonatomic) Students* student7;
@property (strong, nonatomic) Students* student8;
@property (strong, nonatomic) Students* student9;
@property (strong, nonatomic) Students* student10;*/

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
    self.student1 = [[Students alloc]init];
    self.student2 = [[Students alloc]init];
    self.student3 = [[Students alloc]init];
    self.student4 = [[Students alloc]init];
    self.student5 = [[Students alloc]init];
    self.student6 = [[Students alloc]init];
    self.student7 = [[Students alloc]init];
    self.student8 = [[Students alloc]init];
    self.student9 = [[Students alloc]init];
    self.student10 = [[Students alloc]init];

    
    self.student1.name = @"Kirill";
    self.student1.lastName = @"Konovalov";
    self.student1.mark = [self randomMark];
    
    self.student2.name = @"Olya";
    self.student2.lastName = @"Polyanska";
    self.student2.mark = [self randomMark];
    
    self.student3.name = @"Zhenya";
    self.student3.lastName = @"Simon";
    self.student3.mark = [self randomMark];

    self.student4.name = @"Leha";
    self.student4.lastName = @"Rudiuk";
    self.student4.mark = [self randomMark];

    self.student5.name = @"Tony";
    self.student5.lastName = @"Boretskii";
    self.student5.mark = [self randomMark];

    self.student6.name = @"Denis";
    self.student6.lastName = @"Kochubei";
    self.student6.mark = [self randomMark];

    self.student7.name = @"Egor";
    self.student7.lastName = @"Noskov";
    self.student7.mark = [self randomMark];

    self.student8.name = @"Denis";
    self.student8.lastName = @"Korkin";
    self.student8.mark = [self randomMark];

    self.student9.name = @"Grisha";
    self.student9.lastName = @"Lozovoi";
    self.student9.mark = [self randomMark];

    self.student10.name = @"Vitalii";
    self.student10.lastName = @"Khodzinskii";
    self.student10.mark = [self randomMark];*/


    
    
    
    self.arrayOfStudents = [NSArray arrayWithObjects:
                            [[Students alloc] initWithName:@"Kirill" andLastName:@"Konovalov" andMark:[self randomMark]],
                            [[Students alloc] initWithName:@"Olga" andLastName:@"Polyanska" andMark:[self randomMark]],
                            [[Students alloc] initWithName:@"Denis" andLastName:@"Kochubei" andMark:[self randomMark]],
                            [[Students alloc] initWithName:@"Anton" andLastName:@"Boretskii" andMark:[self randomMark]],
                            [[Students alloc] initWithName:@"Zhenya" andLastName:@"Simon" andMark:[self randomMark]],
                            [[Students alloc] initWithName:@"Leha" andLastName:@"Rudiuk" andMark:[self randomMark]],
                            nil];

    NSArray* sortedArray;
    
    sortedArray = [self.arrayOfStudents  sortedArrayUsingComparator: ^(id a, id b) {
        Students* st1 = a;
        Students* st2 = b;
        
        if ( [st1.name isEqualToString: st2.name] ) {
            return [st1.lastName compare: st2.lastName];
        }
        else {
            return [st1.name compare: st2.name];
        }
    }];
    

    
    self.arrayOfExcellentStudents = [NSMutableArray array];
    self.arrayOfGoodStudents = [NSMutableArray array];
    self.arrayOfBadStudents = [NSMutableArray array];
    
    for (Students* anyStudent in sortedArray) {
        
        if (anyStudent.mark == 2) {
            [self.arrayOfBadStudents addObject:anyStudent];
        }
        
        else if ((anyStudent.mark >= 3) && (anyStudent.mark <= 4)) {
            [self.arrayOfGoodStudents addObject:anyStudent];
        }
        
        else {
            [self.arrayOfExcellentStudents addObject:anyStudent];
        }
        
        NSLog(@"%@", self.arrayOfBadStudents);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) randomMark {
    
    int mark = arc4random()%4 + 2;
    return mark;
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger i = 0;

    if (section == 0) {
        i = [self.arrayOfBadStudents count];
    }
    
    else if (section == 1) {
        i = [self.arrayOfGoodStudents count];

    }
    
    else {
        i = [self.arrayOfExcellentStudents count];
    }
    
    
    return i;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString* label;
    if (section == 0) {
      label = @"Bad Students";
    }
    
    else if (section == 1) {
        label = @"Good Students";
        
    }
    
    else {
        label = @"Excellent Students";
    }
    
    
    return label;
    
    }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    NSLog(@"cellForRowAtIndexPath: %d %d", indexPath.section, indexPath.row);
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    
    Students* superStudent;
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];

    
        if (indexPath.section == 0) {
            superStudent = [self.arrayOfBadStudents objectAtIndex:indexPath.row];
            cell.detailTextLabel.textColor = [UIColor redColor];

        }
        
        else if (indexPath.section == 1) {
            superStudent = [self.arrayOfGoodStudents objectAtIndex:indexPath.row];
            cell.detailTextLabel.textColor = [UIColor greenColor];
        }
        
        else {
            superStudent = [self.arrayOfExcellentStudents objectAtIndex:indexPath.row];
            cell.detailTextLabel.textColor = [UIColor blueColor];
        }
        
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",
                           superStudent.name, superStudent.lastName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", superStudent.mark];

    
    return cell;
}

@end
