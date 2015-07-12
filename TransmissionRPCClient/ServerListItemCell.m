//
//  ServerListItemCell.m
//  TransmissionRPCClient
//
//  Created by Alexey Chechetkin on 24.06.15.
//  Copyright (c) 2015 Alexey Chechetkin. All rights reserved.
//

#import "ServerListItemCell.h"

@implementation ServerListItemCell

{
    UISegmentedControl *_segmentButton;
}

// add Edit button to the row
- (void)awakeFromNib
{
    [super awakeFromNib];

   // lets try uisegmented control
    _segmentButton = [[UISegmentedControl alloc] initWithItems:@[@"Edit"]];
    [_segmentButton setTintColor:[UIColor grayColor]];
    [_segmentButton addTarget:self action:@selector(segmentTouched:) forControlEvents:UIControlEventValueChanged];
    [_segmentButton setWidth:_segmentButton.bounds.size.width * 1.5 forSegmentAtIndex:0];
    
    self.editingAccessoryView = _segmentButton;
}

- (void)segmentTouched:(UISegmentedControl*)sender
{
    //sender.selectedSegmentIndex = UISegmentedControlNoSegment;
    if( self.delegate && [self.delegate respondsToSelector:@selector(editButtonTouched:atPath:)] )
        [self.delegate editButtonTouched:sender atPath:self.indexPath];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.selectedSegmentIndex = UISegmentedControlNoSegment;
    });
}

- (void)willTransitionToState:(UITableViewCellStateMask)state
{
    [super willTransitionToState:state];
    
    NSLayoutConstraint *nameLabelTrail = self.contentView.constraints[4];

    if( state & UITableViewCellStateShowingDeleteConfirmationMask )
    {
         nameLabelTrail.constant = -(16 + _segmentButton.bounds.size.width);
    }
    
    if( state == UITableViewCellStyleDefault )
    {
        nameLabelTrail.constant = - 8;
    }
}

@end