function latentTruth(d, chains, nBins, height, color, figNum, fontSize)

% latent truth plot
%   requires that d has thurstone field for ordering items,
%   and uItem labels, and chains has muStar field for each item

% gather samples
[nSamples, nChains] = size(chains.muStar_1);
samples = nan(d.nuItem, nSamples*nChains);
for idx = 1:d.nuItem
   samples(idx, :) = chains.(sprintf('muStar_%d', d.thurstone(idx)))(:);
end

% set bins
lo = min(samples(:));
hi = max(samples(:));
step = (hi-lo)/nBins;
binsE = lo:step:hi;

% figure window
figure(figNum); clf; hold on;
set(gcf, ...
   'color'             , 'w'           , ...
   'units'             , 'normalized'  , ...
   'position'          , [.1 .05 .8 .8] , ...
   'paperpositionmode' , 'auto'        );

% axis
axis([lo hi 0 d.nuItem+1]);
set(gca, ...
   'units'      , 'normalized'         , ...
   'position'   , [.3 .05 .6 .7]        , ...
   'ytick'      , 1:d.nuItem           , ...
   'yticklabel' , d.uItem(d.thurstone) , ...
   'xtick'      , []                   , ...
   'ydir'       , 'reverse'            , ...
   'ticklength' , [.01 0]              , ...
   'tickdir'    , 'out'                , ...
   'box'        , 'off'                , ...
   'clipping'   , 'off'                , ...
   'fontsize'   , fontSize             );

% count
count = nan(d.nuItem, nBins);
for idx = 1:d.nuItem
   tmp = histc(samples(idx, :), binsE);
   count(idx, :) = tmp(1:end-1);
end
count = height*count/max(count(:));

% bars
for idx = 1:d.nuItem
   keep = find(count(idx, :) > 0);
   patch([binsE(keep(1)) binsE(keep) binsE(keep(end))], [0 -count(idx, keep) 0]+idx, color, ...
      'edgecolor' , 'w'  );
end



