#taxliab

This repository contains a Matlab function that calculates federal tax liability, average and marginal tax rates from taxable income for a given year in the US (1913-2013).

###Background

The revolutionary Stata command `taxsim9` calculates federal and state income tax liability from 21 input variables. The command is very sophisticated, determining, for instance, whether a tax filer is better off itemizing or claiming the standard deduction. However, `taxsim9` is less useful for more basic calculations such as estimating tax liability and marginal tax rates given taxable income (rather than gross or adjusted gross income with deductions). Another Stata command, `taxcalc` (available from the NBER by request), calculates tax liability from more basic inputs, but is still sophisticated in terms of the inputs it receives and, more importantly, is limited to PUF and INSOLE data. You can read the NBER comparison of the commands [here](http://www.nber.org/taxcalc/). Because `taxsim9`, `taxcalc` or — to mine or Kyle Rozema's knowledge—any other Stata command cannot perform analyses on the aggregated IRS SOI data on taxable income, we wrote the `taxliab` module for Stata. We produced the Matlab version of `taxliab` in order to perform the same calculations in Matlab.

###Stata
Install `taxliab` by opening Stata and running the command:

`net install taxliab, from(http://kylerozema.com/stata/taxliab)`

The documentation for taxliab is included with the installation. To read the documentation, run the command:

`help taxliab`

###Matlab

To use the Matlab function contained in this repository, place the `taxliab.m` file along with its accompanying dataset `UStaxschedule.mat` into your Matlab working directory and call it in the standard way.

It requires three input variables: nominal taxable income, year, and filing status.

Filing status codes:  <ol>
  <li>Married filing together</li>
  <li>Married filing separately</li>
  <li>Single</li>
  <li>Head of Household</li>
</ol>

Run the `taxliab_example.m` script to demonstrate examples of how the `taxliab.m` function can be used.

<div>
    <a href="https://plot.ly/~hautahi/30/" target="_blank" title="Nominal Tax Liability Series" style="display: block; text-align: center;"><img src="https://plot.ly/~hautahi/30.png" alt="Nominal Tax Liability Series" style="max-width: 100%;width: 792px;"  width="792" onerror="this.onerror=null;this.src='https://plot.ly/404.png';" /></a>
    <script data-plotly="hautahi:30" src="https://plot.ly/embed.js" async></script>
</div>
