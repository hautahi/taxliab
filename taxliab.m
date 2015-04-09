% Authors: Hautahi Kingi (hrk55@cornell.edu) & Kyle Rozema (ktr35@cornell.edu)
% Date: 4 April 2015

% This function calculates the tax liability, marginal and average tax rate
% of a tax-filer.

%INPUTS:    income  = nominal taxable income
%           year    = year
%           status  = filing status which is [1: married filing together, 2: married filing separately, 3: single, 4:HoH]

%OUTPUTS:   tax_liability = total nominal tax payable during the year
%           marg_rate     = marginal tax rate
%           avg_rate      = average tax paid across all income
%           filing_status = A string of the filing status used.

function [tax_liability,marg_rate,avg_rate,filing_status] = taxliab(income,year,status)

% Load tax schedule (5 cells denoted 'taxliab_data)
load('UStaxschedule');

% Check for valid inputs
if not(any(status==[1 2 3 4]))
    error('The filing status you entered is invalid. Must be integer between 1-4')
elseif not(any(year==taxliab_data{status}(:,end)))
    error('The year you entered is invalid. Only years 1913-2013 are valid.')
elseif income<0
    error('Income must be positive.')
else

% Determine filing status
filing_status = taxliab_data{5}(status);

% Use year and status applicable data
year_taxdata   = taxliab_data{status}(taxliab_data{status}(:,end)==year,:)';

% Remove year column
year_taxdata   = year_taxdata(1:end-1);

% Create a vector each for mtr and tax bracket edges
mtr = year_taxdata(1:3:length(year_taxdata));
income_min = year_taxdata(2:3:length(year_taxdata));
income_max = year_taxdata(3:3:length(year_taxdata));

% Determine the tax bracket
index = max(1,find(income<=income_max & income>income_min));

% Determine the marginal rate
marg_rate = mtr(index);

% Determine the tax liability
tax_liability = (sum((income_max(1:index-1)-income_min(1:index-1)).*mtr(1:index-1)) + (income - income_min(index))*mtr(index))/100;

% Determine the average tax
avg_rate = tax_liability./income*100;

end
