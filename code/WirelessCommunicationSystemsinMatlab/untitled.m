%% Generate Sine Wave Signal and Its Harmonics
clear all; close all; clc;

% Signal parameters
fs = 1000;          % Sampling frequency (Hz)
t_duration = 1;     % Signal duration (seconds)
f0 = 10;            % Fundamental frequency (Hz)
A0 = 1;             % Fundamental amplitude
num_harmonics = 5;  % Number of harmonics (including fundamental)

% Generate time vector
t = 0:1/fs:t_duration-1/fs;
N = length(t);

% Initialize signals
fundamental = A0 * sin(2*pi*f0*t);  % Fundamental signal
signal = fundamental;                % Total signal

% Generate harmonics (including fundamental)
harmonics = zeros(num_harmonics, N);
harmonic_freqs = zeros(1, num_harmonics);
harmonic_amplitudes = zeros(1, num_harmonics);

for n = 1:num_harmonics
    freq = f0 * n;  % nth harmonic frequency
    amplitude = A0 * (0.8^n);  % Harmonic amplitude decreases exponentially
    
    harmonics(n, :) = amplitude * sin(2*pi*freq*t);
    
    if n > 1  % If it's a harmonic (not fundamental)
        signal = signal + harmonics(n, :);
    end
    
    harmonic_freqs(n) = freq;
    harmonic_amplitudes(n) = amplitude;
end

% Time-domain plots
figure('Position', [100, 100, 1200, 800]);

% 1. Fundamental signal
subplot(3, 2, 1);
plot(t, fundamental, 'b', 'LineWidth', 1.5);
title(sprintf('Fundamental Signal: %.1f Hz, Amplitude: %.2f', f0, A0));
xlabel('Time (s)'); ylabel('Amplitude');
xlim([0, 0.2]);  % Show only first 0.2 seconds for clarity
grid on;

% 2. Individual harmonic signals
subplot(3, 2, 2);
colors = lines(num_harmonics);
hold on;
for n = 1:num_harmonics
    plot(t, harmonics(n, :), 'Color', colors(n, :), ...
         'LineWidth', 1, 'DisplayName', sprintf('n=%d (%.1f Hz)', n, harmonic_freqs(n)));
end
hold off;
title('Individual Harmonic Signals');
xlabel('Time (s)'); ylabel('Amplitude');
xlim([0, 0.2]);  % Show only first 0.2 seconds
legend('Location', 'eastoutside');
grid on;

% 3. Composite signal
subplot(3, 2, 3);
plot(t, signal, 'r', 'LineWidth', 1.5);
title(sprintf('Composite Signal (Fundamental + %d Harmonics)', num_harmonics-1));
xlabel('Time (s)'); ylabel('Amplitude');
xlim([0, 0.2]);  % Show only first 0.2 seconds
grid on;

% 4. Frequency domain analysis with sinc envelope
subplot(3, 2, [4, 6]);
% Calculate FFT
f = (0:N-1)*(fs/N);  % Frequency vector
signal_fft = fft(signal)/N;
signal_fft_mag = abs(signal_fft(1:N/2+1))*2;  % Single-sided spectrum
signal_fft_mag(1) = signal_fft_mag(1)/2;  % DC component
f_plot = f(1:N/2+1);

% Plot spectrum with stems
stem(f_plot, signal_fft_mag, 'b', 'LineWidth', 1.5, 'Marker', 'none');
hold on;

% Add sinc envelope
% The envelope is determined by the rectangular window in time domain
% sinc(x) = sin(pi*x)/(pi*x)
T = t_duration;  % Observation time
sinc_x = f_plot * T;  % Frequency scaled by observation time
sinc_env = abs(sinc(sinc_x));  % sinc function envelope

% Normalize sinc envelope to match harmonic amplitudes
sinc_env = sinc_env * max(signal_fft_mag) / max(sinc_env(2:end));

% Plot sinc envelope
plot(f_plot, sinc_env, 'g--', 'LineWidth', 2, 'DisplayName', 'Sinc Envelope');

% Mark harmonic positions
for n = 1:num_harmonics
    freq_marker = harmonic_freqs(n);
    % Find nearest frequency point
    [~, idx] = min(abs(f_plot - freq_marker));
    stem(freq_marker, signal_fft_mag(idx), 'r', 'LineWidth', 2, 'Marker', 'o', ...
         'DisplayName', sprintf('Harmonic %d', n));
    text(freq_marker, signal_fft_mag(idx)*1.1, sprintf('%.1f Hz\n(%.3f)', ...
        freq_marker, signal_fft_mag(idx)), 'HorizontalAlignment', 'center');
end
hold off;

title('Frequency Spectrum with Sinc Envelope');
xlabel('Frequency (Hz)'); ylabel('Magnitude');
xlim([0, f0*num_harmonics*1.2]);  % Show all harmonics
ylim([0, max(signal_fft_mag)*1.2]);
legend('Location', 'northeast');
grid on;

% 5. Harmonic amplitude distribution
subplot(3, 2, 5);
bar(1:num_harmonics, harmonic_amplitudes, 'FaceColor', [0.2, 0.6, 0.8]);
title('Harmonic Amplitude Distribution');
xlabel('Harmonic Order (n)');
ylabel('Amplitude');
xticks(1:num_harmonics);
grid on;

% Add overall title
sgtitle(sprintf('Sine Wave Signal and Harmonics Analysis (Fundamental: %.1f Hz, Sampling Rate: %d Hz)', f0, fs));

% Display signal information
fprintf('Signal Parameters:\n');
fprintf('Sampling frequency: %d Hz\n', fs);
fprintf('Number of samples: %d\n', N);
fprintf('Fundamental frequency: %.1f Hz\n', f0);
fprintf('Harmonic orders: 1-%d\n', num_harmonics);
fprintf('Harmonic frequencies: %s Hz\n', mat2str(harmonic_freqs, 3));
fprintf('Harmonic amplitudes: %s\n', mat2str(harmonic_amplitudes, 3));

% Additional analysis: sinc function explanation
fprintf('\nSinc Envelope Information:\n');
fprintf('Observation time T = %.2f seconds\n', t_duration);
fprintf('Main lobe width = %.2f Hz\n', 2/t_duration);
fprintf('First null at frequency = %.2f Hz\n', 1/t_duration);