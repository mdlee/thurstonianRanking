# thurstonianRanking
 MATLAB and JAGS code for Thurstonian aggregation of ranking data
 
 This repository extends and corrects the modeling in 
 
 > Lee, M.D., Steyvers, M., & Miller, B.J. (2014). A cognitive model for aggregating people’s rankings. PLoS ONE, 9.
 
 The JAGS model is in ThurstoneRank_2.txt. It differs from the published model by explicitly controlling invariances from shifts in the `mu` item location and scale changes in the `sigma` person expertise parameters.
 
The MATLAB script ThurstoneRank_2.m applies the model to the same datasets from the original paper. The results for each dataset are summarized by the tauPerformance and aggregateScatter plots. Note that the aggregateScatter plots order the items according to the Thurstonian order, not the ground truth.
