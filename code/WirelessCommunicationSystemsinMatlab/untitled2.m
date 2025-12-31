% 测试histogram函数是否可用
try
    histogram([1,2,3,4,5])
    disp('histogram函数可用');
catch
    disp('histogram函数不可用');
    
    % 显示MATLAB版本
    disp(['MATLAB版本: ', version]);
    
    % 显示可用函数
    disp('类似函数:');
    which hist -all
    which histc -all
end