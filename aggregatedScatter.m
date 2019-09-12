function aggregatedScatter(d, colorDot, scale, figNum, fontSize)

% aggregated scatter plot
%   requires that d has ranking matrix, thurstone field for ordering items,
%   and uItem labels

% figure window
figure(figNum); clf; hold on;
set(gcf, ...
    'color'             , 'w'           , ...
    'units'             , 'normalized'  , ...
    'position'          , [.1 .1 .8 .8] , ...
    'paperpositionmode' , 'auto'        );

% axis
axis([1-scale/2 d.nuItem+scale/2 1-scale/2 d.nuItem+scale/2]);
set(gca, ...
    'units'      , 'normalized'       , ...
    'position'   , [.3 .1 .6 .8]      , ...
    'ytick'      , 1:d.nuItem         , ...
    'yticklabel' , ''                 , ...
    'xtick'      , 1:d.nuItem         , ...
    'xticklabel' , ''                 , ...
    'xaxisloc'   , 'bottom'           , ...
    'yaxisloc'   , 'left'             , ...
    'ydir'       , 'reverse'          , ...
    'ticklength' , [.01 0]            , ...
    'tickdir'    , 'out'              , ...
    'box'        , 'off'              , ...
    'fontsize'   , fontSize           );
axis square;
xlabel('Ranking', 'fontsize', fontSize);

% aggregates scatter data panel
count = zeros(d.nuItem, d.nuItem);
for i = 1:d.nuItem
    for j = 1:d.nuItem
        count(i, j) = length(find(d.ranked(:, d.thurstone(i)) == j));
    end
end
count = count/max(count(:));

% scatterplot
plot([1 d.nuItem], [1 d.nuItem], 'k-');
for i = 1:d.nuItem
    for j = 1:d.nuItem
        if count(i, j) > 0
            radius = scale*sqrt(count(i, j));
            rectangle(...
                'position'  , [j-radius/2 i-radius/2 radius radius] , ...
                'curvature' , [1 1]                                 ,  ...
                'facecolor' , colorDot                              , ...
                'edgecolor' , 'w'                                   );
        end
    end
end

% legend subplot
labelAX = axes; cla; hold on;
axis([0 1 1-scale/2 d.nuItem+scale/2]);
set(labelAX, ...
    'units'    , 'normalized'      , ...
    'position' , [0.1 .1 .25 .8] , ...
    'ydir'     , 'rev'             );
axis off;
for i = 1:d.nuItem
    text(1, i, sprintf('%s ', char(d.uItem(d.thurstone(i)))), ...
        'horizontalalignment' , 'right'   , ...
        'fontsize'            , fontSize  );
end