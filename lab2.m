%1 задание
step = 1.8;
mi = [1 2 19 60 17 0 1];
V = sum(mi);
pi = mi./V;
centers = -5.1:step:5.7;
disp(centers)
%2 задание
bar(centers, pi./step, 1);
xlabel('$$X$$', 'Interpreter', 'Latex','FontSize', 12, 'Color', 'k')
ylabel('$$Y$$', 'Interpreter', 'Latex','FontSize', 12, 'Color', 'k')
hold on
%3 задание
%матожидание
M = sum(centers.*pi); 
%дисперсия
D = sum(((centers-M).^2).*pi);
%Оценка параметров методом моментов
n = (2*D)/(D-1); %Число степеней свободы
x = -5.1:0.1:5.7;
plot(x, tpdf(x, n));
%4 задание
%Уровень значимости
alfa = 0.05;
% f - число степеней свободы
% f = k - s, k - кол-во интервалов, s - кол-во независимых условий s = 1 +
% r, r - кол-во параметров закона распределения
% f = 7-(1+1) = 5
f = 5;
ua = chi2inv(1-alfa, f); %Критическая граница
Pi = tcdf(centers+step./2, n) - tcdf(centers-step./2, n);
%Мера расхождения между данными и моделью в методе К. Пирсона
u = sum(((mi-V.*Pi).^2)./(V.*Pi));
if u < ua
    disp('Принимаем гипотезу.')
else 
    disp('Отвергаем гипотезу.')
end


