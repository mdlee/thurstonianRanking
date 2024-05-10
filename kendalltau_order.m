function tau = kendalltau_order( order1 , order2 )
%% Returns the Kendall tau distance between two orderings
% Change representation to ranks
[ dummy , ranking1 ] = sort( order1 , 2 , 'ascend' );
[ dummy , ranking2 ] = sort( order2 , 2 , 'ascend' );
N = length( ranking1 ); % number of items
[ ii , jj ] = meshgrid( 1:N , 1:N );
ok = find( jj(:) > ii(:) );
ii = ii( ok );
jj = jj( ok );
nok = length( ok );
sign1  = ranking1( jj ) > ranking1( ii );
sign2  = ranking2( jj ) > ranking2( ii );
tau = sum( sign1 ~= sign2 );