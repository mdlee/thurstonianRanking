# thurstonianRanking
 MATLAB and JAGS code for Thurstonian aggregation of ranking data
 
 This repository extends and corrects the modeling in 
 
 > Lee, M.D., Steyvers, M., & Miller, B.J. (2014). A cognitive model for aggregating people’s rankings. PLoS ONE, 9.
 
 The JAGS model is in `ThurstoneRank_2.txt`. It differs from the published model by explicitly controlling invariances from shifts in the *mu* item location and scale changes in the *sigma* person expertise parameters.
 
The MATLAB script `ThurstoneRank_2.m` applies the model to the same datasets from the original paper. It relies on the [trinity](https://github.com/joachimvandekerckhove/trinity) package to connect MATLAB to JAGS.

The results for each dataset are summarized by the plotting functions `tauPerformance.m` and `aggregateScatter.m`, and are provided in the resultsFigures subfolder. These plots take essentially the same form as those in the paper. Note that the aggregateScatter plots order the items according to the Thurstonian order, not the ground truth. These plotting functions use the color pallette provided by `PantoneSpring2015.mat`.

The data are loaded by the `loadData.m` function, and the same data are also available in the `RankingData.xlsx` spreadsheet.

Thanks to Behrooz Etesamipour for identifying the need to correct the code.
