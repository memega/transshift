//
//  FileListFSCell.h
//  TransmissionRPCClient
//
//  Created by Alexey Chechetkin on 03.07.15.
//  Copyright (c) 2015 Alexey Chechetkin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CELL_ID_FILELISTFSCELL                      @"fileListFSCell"
#define FILELISTFSCELL_LEFTLABEL_WIDTH              28
#define FILELISTFSCELL_LEFTLABEL_LEVEL_INDENTATION  15

@interface FileListFSCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioritySegment;
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;

@end