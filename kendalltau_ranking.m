function tau = kendalltau_ranking( ranking1 , ranking2 )
%% Returns the unnormalized Kendall tau distance between two rankings

%% Note that for this version of Kendall Tau function, the input vectors contain ranks and not item indices!

N = length( ranking1 ); % number of items
[ ii , jj ] = meshgrid( 1:N , 1:N );
ok = find( jj(:) > ii(:) );
ii = ii( ok );
jj = jj( ok );

nok = length( ok );

sign1  = ranking1( jj ) > ranking1( ii );
sign2  = ranking2( jj ) > ranking2( ii );

tau = sum( sign1 ~= sign2 );