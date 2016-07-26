# UICollectionView-log-
UICollectionView控制台打印log错误信息解决
2016-07-26 14:41:24.212 TableViewAutoHeight[13033:273442] the behavior of the UICollectionViewFlowLayout is not defined because:
2016-07-26 14:41:24.213 TableViewAutoHeight[13033:273442] the item height must be less than the height of the UICollectionView minus the section insets top and bottom values, minus the content insets top and bottom values.
2016-07-26 14:41:24.213 TableViewAutoHeight[13033:273442] The relevant UICollectionViewFlowLayout instance is <UICollectionViewFlowLayout: 0x7fee005a6380>, and it is attached to <UICollectionView: 0x7fee0104d800; frame = (10 53.5; 355 151.5); clipsToBounds = YES; gestureRecognizers = <NSArray: 0x7fee005a7270>; layer = <CALayer: 0x7fee005a6780>; contentOffset: {0, 0}; contentSize: {1875, 151.66666666666669}> collection view layout: <UICollectionViewFlowLayout: 0x7fee005a6380>.
2016-07-26 14:41:24.213 TableViewAutoHeight[13033:273442] Make a symbolic breakpoint at UICollectionViewFlowLayoutBreakForInvalidSizes to catch this in the debugger.

1. collectionViewCell
	设置cell的itemSize
	         insets 
	collectionView frame
2. collectionView.frame.size.height == cell.size.height + insetTop + insetBottom
3. collectionView.frame.size.width == cell.size.width + insetLeft + insetRight
4. 报错原因是collectionView的frame < cell 的frame导致
5. the item height must be less than the height of the UICollectionView minus the section insets top and bottom values, minus the content insets top and bottom values.
该项目高度必须小于该UICollectionView减去部分插入顶部和底部的高值，减去内容插入顶部和底部的值。
6.也就是说这是一道小学一年级的数学题。
