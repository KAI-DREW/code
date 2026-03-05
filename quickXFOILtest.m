function quickXFOILtest()
    % 测试单个翼型
    xfoilPath = 'C:\Users\KAI\Desktop\XFOIL6.99\xfoil.exe';
    airfoilFile = 'C:\Users\KAI\Desktop\XFOIL6.99\FFA_W3_241.dat';
    
    % 设置输出文件名
    outputFile = 'xfoil_output.txt';  % 生成的存储文件
    
    % 创建输入命令
    fid = fopen('test_input.txt', 'w');
    fprintf(fid, 'PLOP\nG\n\n');
    fprintf(fid, 'LOAD %s\n', airfoilFile);
    fprintf(fid, 'OPER\n');
    fprintf(fid, 'VISC 1000000\n');
    fprintf(fid, 'PACC\n');        % 打开数据记录
    fprintf(fid, '%s\n', outputFile);  % 指定输出文件名
    fprintf(fid, '\n');           % 空行（不添加描述）
    fprintf(fid, 'ASEQ\n-20\n20\n1\n');
    fprintf(fid, '\n');           % 开始计算
    fprintf(fid, 'PACC\n');       % 关闭数据记录
    fprintf(fid, 'QUIT\n');
    fclose(fid);
    
    % 执行
    system([xfoilPath ' < test_input.txt']);
    
    % 显示结果文件信息
    if exist(outputFile, 'file')
        fprintf('数据文件已生成: %s\n', outputFile);
    else
        fprintf('未找到输出文件\n');
    end
    
    delete('test_input.txt');
end