%% Load
[file, path] = uigetfile('*.mat');
S = load(fullfile(path, file));
RF_3D = S.RF_3D;

num_rec   = 4500;            % Maximum number of scanning lines to process
fs        = 5e7;             % Sampling frequency (Hz)
Ts        = 1/fs;            % Sampling interval (s)
L0        = 1e5;             % Zero-padding length
window    = 10;              % Number of scanning lines per segment
interval  = 0;               % Interval between segments
% Frequency window
freqStart = 220000;
freqStop  = 240000;
% Initial peak-search window
peakWinStart = 5000;
peakWinStop  = freqStop - freqStart - 1;
peakHalfWin  = 400;

zeroPad = zeros(L0, 1);
sigLen  = size(RF_3D, 1);
N2      = (L0 + sigLen) * (window + 1);
maxIter  = floor((num_rec - window) / (interval + window)) + 1;
peakIdx  = zeros(maxIter, 1);

%% Segmented FFT, Envelope and Peak Tracking
aa = 1;
while (interval * (aa - 1) + window * (aa + 1)) < num_rec
    mStart = interval * (aa - 1) + window * aa;
    mEnd   = interval * (aa - 1) + window * (aa + 1);
    siga = [];
    for m0 = mStart:mEnd
        sigm = RF_3D(:, m0, 5); 
        siga = [siga; sigm; zeroPad]; 
    end
    sigrec = siga.';

    Xrec    = fft(sigrec, N2);
    amplAll = abs(Xrec);
    amplWin = amplAll(freqStart:freqStop);
    [envUp, ~] = envelope(amplWin, 200, 'peak');
    [~, locIdx] = max(envUp(peakWinStart:peakWinStop));
    peakIdx(aa) = locIdx + peakWinStart + freqStart;
    peakWinStop  = peakWinStart + locIdx + peakHalfWin;
    peakWinStart = peakWinStart + locIdx - peakHalfWin;

    aa = aa + 1;
end
peakIdx = peakIdx(1:aa-1);
spectralRes = fs / N2;
peakFreqHz  = peakIdx * spectralRes;   % Hz
peakFreqMHz = peakFreqHz / 1e6;        % MHz

%% Plot
figure('Color', 'w');
plot(peakFreqMHz, 'LineWidth', 1.5, 'Color', [0.00 0.45 0.74]);
box on;
xlabel('Sample points', 'FontSize', 12);
ylabel('Peak frequency (MHz)', 'FontSize', 12);
set(gca, 'FontSize', 11, 'LineWidth', 1.0);
ax = gca;
ytickformat(ax, '%.3f');