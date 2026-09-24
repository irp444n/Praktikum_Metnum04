clc;
clear;
format long;

%% SOAL 1: Aproksimasi e^0.3 dengan Deret Taylor
% e^x = sum_{i=0}^{n} x^i / i!
x = 0.3;
nilai_sebenarnya_exp = exp(x);
jumlah_exp = 0;

fprintf('\nSOAL 1: DERET TAYLOR e^0.3\n');
fprintf('Nilai sebenarnya = %.12f\n', nilai_sebenarnya_exp);
fprintf(' n       Aproksimasi          Galat Absolut       Galat Relatif (%%)\n');

for n = 0:4
    jumlah_exp = jumlah_exp + x^n / factorial(n);
    galat_absolut = abs(nilai_sebenarnya_exp - jumlah_exp);
    galat_relatif = galat_absolut / abs(nilai_sebenarnya_exp) * 100;

    fprintf('%2d   %.12f     %.12e     %.10e\n', ...
        n, jumlah_exp, galat_absolut, galat_relatif);
end

%% SOAL 2: Jumlah 1 + 1/2 + 1/3 + ... + 1/20
fprintf('\nSOAL 2: PENJUMLAHAN PECAHAN\n');

% a. Penjumlahan secara langsung
jumlah_langsung = 0;
for k = 1:20
    jumlah_langsung = jumlah_langsung + 1/k;
end

% b. Pembulatan setiap hasil pembagian ke bilangan bulat terdekat
jumlah_dibulatkan = 0;
for k = 1:20
    jumlah_dibulatkan = jumlah_dibulatkan + round(1/k);
end

% c. Tanpa perulangan eksplisit menggunakan fungsi sum
jumlah_fungsi_sum = sum(1 ./ (1:20));

fprintf('a. Penjumlahan langsung             = %.12f\n', jumlah_langsung);
fprintf('b. Setiap pecahan dibulatkan        = %.12f\n', jumlah_dibulatkan);
fprintf('c. Menggunakan fungsi sum           = %.12f\n', jumlah_fungsi_sum);

%% SOAL 3: Aproksimasi sin(1) dengan Deret Taylor
% sin(x) = sum_{n=0}^{N} (-1)^n*x^(2*n+1)/(2*n+1)!
x = 1;
nilai_sebenarnya_sin = sin(x);

fprintf('\nSOAL 3: DERET TAYLOR sin(1)\n');
fprintf('Nilai sebenarnya = %.12f\n', nilai_sebenarnya_sin);
fprintf(' N       Aproksimasi          Galat Absolut       Galat Relatif (%%)\n');

for N = 1:5
    jumlah_sin = 0;

    for n = 0:N
        suku = (-1)^n * x^(2*n+1) / factorial(2*n+1);
        jumlah_sin = jumlah_sin + suku;
    end

    galat_absolut = abs(nilai_sebenarnya_sin - jumlah_sin);
    galat_relatif = galat_absolut / abs(nilai_sebenarnya_sin) * 100;

    fprintf('%2d   %.12f     %.12e     %.10e\n', ...
        N, jumlah_sin, galat_absolut, galat_relatif);
end