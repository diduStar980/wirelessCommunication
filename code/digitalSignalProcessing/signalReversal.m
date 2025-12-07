n=-10:10;
x=exp(-n);
subplot(2,1,1),plot(n,x);
title('原始信号');
line([0 0],ylim);
% line([0 0], ylim) 这行代码在 MATLAB 中的作用是：
% 在图形上绘制一条垂直于 X 轴的直线，该直线穿过 X=0 这个点。
% 在当前坐标区中绘制一条从点 (x1, y1) 到点 (x2, y2) 的线段。
% 基本语法是：line([x1, x2], [y1, y2])

[y,n] = sigfold(x,n);
subplot(2,1,2),plot(n,y);
title('折叠信号');
line([0 0],ylim);
xlabel('n');