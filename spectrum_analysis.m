% 本程序用于信号与系统小组讨论
% 分析男生女生信号的频谱

% [X,Fs] = audioread('Su_JH.wav');    % 组员苏家辉
[X,Fs] = audioread('Ding_KX.wav');  % 组员丁恺昕
% [X,Fs] = audioread('Shen_ZH.wav');  % 组员沈子航
% [X,Fs] = audioread('Zhou_KX.wav');  % 组员周可歆
% [X,Fs] = audioread('Cheng_XY.wav'); % 组员程昕妍
% [X,Fs] = audioread('Kun_DZ.wav');   % 组员昆杜孜
X = X(:,1);    % 取音频单通道

T = 1/Fs;      % 采样周期，Fs为采样频率
L = length(X); % 信号长度
t = (0:L-1)*T; % 时间向量

% 绘制时域波形图
figure(1);
plot(t, X);
title('时域波形图');
xlabel('时间（s）');
ylabel('振幅');

% 频域分析
Y = fft(X);
P2 = abs(Y/L);    % 双边谱
P1 = P2(1:L/2+1); % 单边谱
P1(2:end-1) = 2*P1(2:end-1);
f = Fs/L*(0:(L/2));

% 获取主频峰位置
[~, idx] = max(P1); % idx为频率索引index
fprintf('主频峰位于 %.2f Hz\n', f(idx));

% 绘制频域波形图
figure(2);
plot(f, P1, 'LineWidth', 1); 
xlim([0,1000]); % 只显示1kHz以内的频谱
title('单边幅度谱');
xlabel('频率（Hz）');
ylabel('|P1(f)|');

