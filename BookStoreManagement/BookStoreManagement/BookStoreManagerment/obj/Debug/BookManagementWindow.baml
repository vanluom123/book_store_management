   M S B A M L   `   `   `  ����O  KBookStoreManagerment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:BookStoreManagermentBookStoreManagerment  5   	   ]3clr-namespace:BookStoreManagerment.CustomControlBar%BookStoreManagerment.CustomControlBar  5   	   G(clr-namespace:BookStoreManagerment.ViewsBookStoreManagerment.Views  5   	   O,clr-namespace:BookStoreManagerment.ViewModelBookStoreManagerment.ViewModel  5	   	   /    )BookStoreManagerment.BookManagementWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35a ]DevExpress.Xpf.Core.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49an jSAPBusinessObjects.WPF.ViewerShared, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35L 9http://schemas.microsoft.com/winfx/2006/xaml/presentation        R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:BookStoreManagerment     5   	   Cuca3clr-namespace:BookStoreManagerment.CustomControlBar     5   	   :views(clr-namespace:BookStoreManagerment.Views     5   	   ;vm,clr-namespace:BookStoreManagerment.ViewModel     5	   	   c	 _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity 	 5
   	   V
 RMaterialDesignThemes.Wpf, Version=2.4.0.1044, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes 
 5   	   c _DevExpress.Xpf.Ribbon.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a>dxr4http://schemas.devexpress.com/winfx/2008/xaml/ribbon  5   	   ;dx2http://schemas.devexpress.com/winfx/2008/xaml/core  6J   <dxb2http://schemas.devexpress.com/winfx/2008/xaml/bars  6�   d `DevExpress.Xpf.Docking.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a@dxdo5http://schemas.devexpress.com/winfx/2008/xaml/docking  6�   -   5        $��BookMngWindow��5   	      MaterialDesignBody#���   5   	   $��Regular"�5      $��13(�5      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5         TextRenderingMode$
 Auto=�5        MaterialDesignFont#���  5        	BookMngVM � DataContext# [ 5       � WindowStartupLocation$ CenterScreen=�5       � Title$ Book Management Window��5   	   $	��600��6(   $
��1024��65    � 
ResizeMode$ NoResize=�6B    � Icon$ Images/BookMng2.png��6X    � WindowStyle$
 None=�5      . 	 (System.Windows.Interactivity.Interaction   Triggers 5      / 	 )System.Windows.Interactivity.EventTrigger  5   
   	   	EventName$	 Loaded��6   . 	 (System.Windows.Interactivity.TriggerBase
   Actions.
 5      6 	 0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *
BookMngCmd+   CommandParameter 6C   ��  �� ElementName$ BookMngWindow��5       � 	Resources 5       �� DataType6   0BookStoreManagerment.ViewModel.DataBookViewModel-   'BookStoreManagerment.Views.DataBookView2   ,BookStoreManagerment.ViewModel.BookMngViewVM,	   &BookStoreManagerment.Views.BookMngView6
   0BookStoreManagerment.ViewModel.CustomerMngViewVM0   *BookStoreManagerment.Views.CustomerMngView  HideMenu �� TargetProperty �� 
TargetName9  3System.Windows.Media.Animation.EasingDoubleKeyFrame O� KeyTime O� Value  ShowMenu��%W  (��       5   1   *, +)(�� Z     5"   0   *, +)(�� �     5%   4   *,
 +)&	     &	 �    �� 5   
   dataBookTemplate��"  61   .R�5          6!   �� 6;   5!      �� 5"   
   bookMngTemplate��"  60   .R�5#      	   6    �� 6:   5$      �� 5%   
   customerMngTemplate��" 
 64   .R�5&         6$   �� 6>   5'      �� 5(   
   .��5)      U� $ (FrameworkElement.Width)�6,   $ GridMenu��6a   .\�5*        $ 0��6'   $	 250Q�63     5+      $ 0:0:0.3��6'   $ 60Q�69   5,      U� 5-      $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�6,   $ image��6�   .\�5.        $ 0��6'   $
 -250Q�63   5/      U� 50      $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.Y)�6,   $ image��6�   .\�51        $ 0��6'   $ 0Q�63   52      U� 53      $ (UIElement.Opacity)�6,   $ packIcon��6\   .\�54        $ 0:0:0.3��6'   $ 1Q�69   55      56      �� 57   
   .��58      U� $ (FrameworkElement.Width)�6,   $ GridMenu��6a   .\�59        $ 0��6'   $ 60Q�63     5:      $ 0:0:0.5��6'   $	 250Q�69   5;      U� 5<      $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�6,   $ image��6�   .\�5=        $ 0��6'   $
 -250Q�63     5>      $ 0:0:0.5��6'   $ 0Q�69     5?      $ 0:0:1��6'   $ 0Q�67   5@      U� 5A      $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.Y)�6,   $ image��6�   .\�5B        $ 0��6'   $ 0Q�63     5C      $ 0:0:0.5��6'   $ 0Q�69     5D      $ 0:0:1��6'   $ 0Q�67   5E      U� 5F      $ (UIElement.Opacity)�6,   $ image��6\   .\�5G        $ 0��6'   $ 0Q�63     5H      $ 0:0:0.5��6'   $	 0.6Q�69     5I      $ 0:0:1��6'   $ 1Q�67   5J      U� 5K      $ (UIElement.Opacity)�6,   $ packIcon��6\   .\�5L        $ 0��6'   $ 1Q�63     5M      $ 0:0:0.5��6'   $ 0Q�69   5N      5O      5P       � Triggers 5Q      :� 5R   
    :� RoutedEvent$ ButtonBase.Click��6    :� 
SourceName$ ButtonCloseMenu��66   .[�5S      �� #��[ 6   5T      :� 5U   
   $ ButtonBase.Click��6   $ ButtonOpenMenu��66   .[�5V      �� #��[ 6   5W      .��5Y      �  � RowDefinitions 5Z   
   �� 5[      $
��Auto �6   6,   �� 5\      6    � ColumnDefinitions 5^   
   �� 5_      $
��Auto �6   6.   �� 5`      6!   .+�5b   
   � $��0��6   $��2��6   .+�5c      <   6BookStoreManagerment.CustomControlBar.UserControlAlter  
 � Tag 6#   �� *Title+$ BookMngWindow��6V   5d      �� 5e   
   -   5         ��Name$ GridMenu��5e      $��1��6'   $��0��64   $	��250��6D   $
��Left=�6P    J� RenderTransformOrigin$ 0.5,0.5&�6k   ��5f      �� 5g       �� ImageSource$% Images/AcountInfoBackground.jpg��6    j� Stretch$ UniformToFill=�6K   .+�5i      � .+�5j      �� -   5         ��Name$ ButtonOpenMenu��5j   *    K� ZIndex$ 1��6     � ToolTip$  	Show Menu��6�    0 ,MaterialDesignFloatingActionMiniAccentButton#��[ 6�   $��40��6  $��40��6)  $��0q�65  $	��Top=�6n  $
��Left=�6�  $��5q�6�  y�6B   �� *BtnShowVisibility+��6k   �� *ShowMenuCmd+��6�   �� $ ButtonOpenMenu����6A  Z� ��6W  Z� .��5k      ' 
 !MaterialDesignThemes.Wpf.PackIcon  � 
 �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.4.0.1044, Culture=neutral, PublicKeyToken=null]]!   Kind$
! Menu=�6.   $��40��6:   $��40��6E   
���   �6Q   5l      �� 5m      -   5        $ ButtonCloseMenu��5m   *   $ 1��6   $  	Hide Menu��6�   #��[ 6�   $��40��6   $��40��6+  $��0q�67  $	��Top=�6p  $
��Left=�6�  $��5q�6�  y�6C   �� *BtnHideVisibility+��6l   �� *HideMenuCmd+��6�   �� $ ButtonCloseMenu����6C  Z� ��6Y  Z� .��5n        $
! Menu=�6.   $��40��6:   $��40��6E   
���   �6Q   5o      �� 5p      -   5        " ��Name$" image��5p      $��Images/DecorationImg.jpg��6(   $
��Fill=�6J   $	��180��6Y   $	��250��6f   $ 0.5,0.5&�6r   z�5q      V� 5r      .~�5s      �� �� 5t      �� 5u      T� 5v      5w      5y        5z      -   5        #  Name$# packIcon��5z   *   $ J� Opacity$$ 0Q�6<   $! Image=�6H   $��40��6U   $��40��6`   $��Center=�6l   $��	5 5 5 -20q�6�   5{      �� 5|      .+�5}      �� $��60��6    5~        5      $ 	 PreviewMouseLeftButtonDown��6)   .
 5�         64   �� *
BookMngCmd+ 6S   �� $ BookMngWindow��5�      .��5�      �� $��60��6!   % �� Orientation$% 
Horizontal=�6-   $��-5q�6F   .+�5�      �� $��40��6!   $��40��6,   $��Center=�68   $��5 0 5 5q�6S   ���	#00000000��5�      �� 5�   "   $ Images/BookMng1.png��6-   5�      �� 5�      $��Quản lí Sách��6$   $��15(�68   $��5q�6F   $��Center=�6Q   5�      5�      �� 5�      $��60��6     5�        5�      $ 	 PreviewMouseLeftButtonDown��6)   .
 5�         64   �� *DataBookCmd+ 6T   �� $ BookMngWindow��5�      .��5�      �� $��50��6"   $% 
Horizontal=�6.   $
��-5 0q�6G   .+�5�        $! BookOpenPageVariant=�62   $��40��6M   $��40��6X   $��Center=�6d   $��5q�6   �� 5�      $"��Quản lí dữ liệu sách��6$   $��15(�6@   $��5q�6N   $��Center=�6Y   5�      5�      �� 5�      $��60��6    5�        5�      $ 	 PreviewMouseLeftButtonDown��6)   .
 5�         64   �� *CustomerMngCmd+ 6W   �� $ BookMngWindow��5�      .��5�      �� $��50��6!   $% 
Horizontal=�6-   $
��-5 0q�6F   .+�5�        $! 
AccountBox=�62   $��40��6D   $��40��6O   $��Center=�6[   $��5q�6v   �� 5�      $��Quản lí khách hàng��6$   $��15(�6>   $��5q�6L   $��Center=�6W   5�      5�      5�      5�      �� 5�   
   $��1��6   $��1��6)   ��66   �� 6L   5�      5�      