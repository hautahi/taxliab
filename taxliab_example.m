% This program demonstrates how one can use the taxliab function

clear; clc; close all;

%%-------------------------------------------------------------------------
% 1. Simple Example
%--------------------------------------------------------------------------

income = 50000;
status=3;
year = 2013;

[a, b, c,d] = taxliab(income,year,status);

% Print result
fprintf('A person with a ')
fprintf(d{1})
fprintf(' filing status, with income of $%i in %i, \n would pay taxes of $%5.0f, ',income,year,a)
fprintf('at a marginal tax rate of %3.1f percent \n and an average tax rate of %3.1f percent. \n',b,c)

%%-------------------------------------------------------------------------
% 2. Plot time series for different 'middle' income groups
%--------------------------------------------------------------------------

years = (1913:1:2013)';
INCOME = [20000,50000,100000];

for i=1:length(years)
    for j=1:length(INCOME)
        tax_paid(i,j) = taxliab(INCOME(j),years(i),status);
    end
end

figure
plot(years,tax_paid,'Linewidth',2.5)
title('Tax Liability for different taxable income groups')
xlabel('Years')
ylabel('Total Tax Liability')
legend('taxable income = $20,000','taxable income = $50,000','taxable income = $100,000')