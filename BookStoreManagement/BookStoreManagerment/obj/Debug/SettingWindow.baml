   M S B A M L   `   `   `  ����O  KBookStoreManagerment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:BookStoreManagermentBookStoreManagerment  5   	   ]3clr-namespace:BookStoreManagerment.CustomControlBar%BookStoreManagerment.CustomControlBar  5   	   (    "BookStoreManagerment.SettingWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35a ]DevExpress.Xpf.Core.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49an jSAPBusinessObjects.WPF.ViewerShared, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35L 9http://schemas.microsoft.com/winfx/2006/xaml/presentation        5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:BookStoreManagerment     5   	   Cuca3clr-namespace:BookStoreManagerment.CustomControlBar     5   	   V	 RMaterialDesignThemes.Wpf, Version=2.4.0.1044, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes 	 5   	   c
 _DevExpress.Xpf.Ribbon.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a>dxr4http://schemas.devexpress.com/winfx/2008/xaml/ribbon 
 5	   	   ;dx2http://schemas.devexpress.com/winfx/2008/xaml/core  6J   <dxb2http://schemas.devexpress.com/winfx/2008/xaml/bars  6�   d `DevExpress.Xpf.Docking.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a@dxdo5http://schemas.devexpress.com/winfx/2008/xaml/docking  6�   -   5          �Name$  settingWindow��5   	      MaterialDesignBody#���   5   	   $��Regular"�5      $��13(�5      &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5         TextRenderingMode$
 Auto=�5        MaterialDesignPaper#���  5        MaterialDesignFont#���  5        	SettingVM � DataContext# [ 5       � WindowStartupLocation$ CenterScreen=�5       � Title$ Setting��5   	   $	��500��6   $	��500��6&    � 
ResizeMode$ NoResize=�62    � Icon$ Images/BookMng2.png��6H    � WindowStyle$
 None=�6c   .��5      � 	 � RowDefinitions	 5   
   �� 5      $
��Auto �6   6,   �� 5      $
��Auto �6   6,   �� 5      $
��Auto �6   6,   �� 5      6   
 � ColumnDefinitions
 5   
   �� 5      6!   �� 5      6!   .+�5!   
   <   6BookStoreManagerment.CustomControlBar.UserControlAlter  $��2��6   $��0��6d   
 � Tag 63   �� *Title+ �� ElementName$ settingWindow��6d   �� 5"   
   $��1��6   $��2��6!   $��Thay đổi quy định��65   $��25(�6N   $��10q�6\   $	��Top=�6h   $��Center=�6�   ���	#FF5F27AD$
��Bold"�6�   �� 5#   
   $��15 0 0 0q�6   $��2��6'   .+�5$      �� $*��$Số lượng nhập tối thiểu: ��6   $��18(�69   $��10q�6G   $��Center=�6S   $
��Left=�6n   
���   �$
��Bold"�6�   6�   �� 5%      $)��#Số lượng tồn tối thiểu: ��6   $��18(�68   $��10q�6F   $��Center=�6R   $
��Left=�6m   
���   �$
��Bold"�6�   6�   �� 5&      $&�� Số lượng nhập tối đa: ��6   $��18(�66   $��10q�6D   $��Center=�6P   $
��Left=�6k   
���   �$
��Bold"�6�   6�   �� 5'      $y�Hidden=�6   $��Số nợ tối đa: ��6,   $��18(�6B   $��10q�6P   $��Center=�6\   $
��Left=�6w   
���   �$
��Bold"�6�   6�   5(      �� 5)   
   $��
0 -15 15 0q�6   $��2��6)   $��1��66   .+�5*      �� $��5q�6e   $��15(�6p   ; 	 5MaterialDesignThemes.Wpf.Transitions.TransitionAssist   DisableTransitions . ��6   �� *LimitedImport+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�6~   �� 5+      $��5q�6f   $��15(�6q    . ��6   �� *LimitedUnStock+$ TwoWay=�$ PropertyChanged=�6   �� 5,      $��5q�6e   $��15(�6p    . ��6   �� *MaximumImport+$ TwoWay=�$ PropertyChanged=�6~   �� 5-      $y�Hidden=�6   $��5q�6~   $��15(�6�    . ��6*   �� *MaximumCustomerDue+$ TwoWay=�$ PropertyChanged=�6�   5.      �� 5/   
   $��25q�6   $��3��6!   $��2��6.   $��Center=�6B   $	��Top=�6_    �� Orientation$ 
Horizontal=�6w   .+�50      �� -   5        $��	btnChange��50   f   + 	 %MaterialDesignThemes.Wpf.ShadowAssist   ShadowDepth$ Depth3=�6w   $��0 0 50 0q�6�    # MaterialDesignRaisedLightButton#��[ 6�   $��Thay đổi��6�   ��6   �� *	ChangeCmd+��63   �� $ 	btnChange��51      �� 52      -   5        $��btnReset��52   d   $ Depth3=�6t   $��0 0 0 0q�6�   #��[ 6�   $��Mặc định��6�   ��6   �� *
ResetCmd+��62   �� $ btnReset��53      54      55      56      