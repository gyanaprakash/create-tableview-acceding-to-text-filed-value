//
//  ViewController.m
//  omnamhasibaya
//
//  Created by JITEN on 10/18/14.
//  Copyright (c) 2014 JITEN. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController
{
    UITableView *table;
}
@synthesize button,textfield;

- (void)viewDidLoad
{
    CGFloat height=44;
    
    table=[[UITableView alloc]initWithFrame:CGRectMake(0, 120, 320, height*[textfield.text intValue])];
    table.delegate=self;
    table.dataSource=self;
    [self.view addSubview:table];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonclicked:(id)sender
{
    if (textfield.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Warning !" message:@"enter no of row" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        CGFloat height=44;

        [table setFrame:CGRectMake(0, 120, 320, height*[textfield.text intValue])];
        [table reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int i=[textfield.text intValue];
    return i;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

        cell.textLabel.text=[NSString stringWithFormat:@"row %ld",indexPath.row+1];
  
       return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
