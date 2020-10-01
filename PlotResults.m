varmat = [I S R D C N];
titles = {'Infected', 'Susceptible', 'Recovered', 'Deceased', 'Agg. cons.', 'Agg. labor'};
figure;
dateseq = datenum(2020,02,08):7:(datenum(2020,02,08)+7*(plot_periods-1));
for x = 1:size(varmat,2)
    subplot(2,3,x);
    plot(dateseq, 100.*varmat(2:(plot_periods+1), x), 'color', [0 0 1], 'linewidth', 2);
    title(titles{x});
    datetick('x','mmm','keeplimits');
end
tightfig;

varmat = [c1_dev c2_dev];
figure;
hold on;
dateseq = datenum(2020,02,08):7:(datenum(2020,02,08)+7*(plot_periods-1));
for x = 1:size(varmat,2)
%     subplot(2,3,x);
    plot(dateseq, 100.*varmat(2:(plot_periods+1), x), 'color', [0 0 1], 'linewidth', 2);
%     title(titles{x});
    datetick('x','mmm','keeplimits');
end
legend('Low-infection sector', 'High-infection sector', 'location', 'Northeast');
tightfig;

SwedenData;
figure;
hold on;
plot(dateseq,100*dD(2:31), 'b', 'linewidth', 2);
plot(dateseq,dD_data(1:30), 'b--', 'linewidth', 2);
legend('Simulated', 'Actual', 'Location', 'NorthEast');
ylabel('Per cent of population');
datetick('x','mmm','keeplimits');
tightfig;