function p = probabilityTable(d, chains, fileName, maxColumnCharacters)

% probability table
%   produces a latex table in a text file with pairwise probabilities
%   of each item having latent truth before each other item


% gather samples
[nSamples, nChains] = size(chains.muStar_1);
samples = nan(d.nuItem, nSamples*nChains);
for idx = 1:d.nuItem
   samples(idx, :) = chains.(sprintf('muStar_%d', d.thurstone(idx)))(:);
end

% probabilities
p = zeros(d.nuItem, d.nuItem);
for i = 1:(d.nuItem-1)
   for j = (i+1):d.nuItem
      tmp = nan(nSamples*nChains, 1);
      for idx = 1:(nSamples*nChains)
         tmp(idx) = mean(circshift(samples(i, :), idx) > samples(j, :));
      end
      p(i, j) = mean(tmp);
      p(j, i) = 1 - p(i, j);
   end
end

% write .txt file with latex
fid = fopen(sprintf('%s_probabilityTable.txt', fileName), 'w');
fprintf(fid, '\\begin{table}\n');
fprintf(fid, '\\begin{center}\n');
fprintf(fid, '\\begin{tabular}{%s}\n', ['r' repmat('c', [1, d.nuItem])]);
fprintf(fid, '\\toprule\n');
str = '';
for idx = 1:d.nuItem
   str = sprintf('%s & %s', str, d.uItem{idx}(1:min(length(d.uItem{idx}), maxColumnCharacters)));
end
fprintf(fid, sprintf('%s \\\\\\\\ \n', str));
fprintf(fid, '\\hline\n');
for idx1 = 1:d.nuItem
   str = d.uItem{idx1};
   for idx2 = 1:d.nuItem
      if idx1 == idx2
         str = sprintf('%s & --', str);
      else
         str = sprintf('%s & %1.2f', str, p(idx1, idx2));
      end
   end
   fprintf(fid, sprintf('%s \\\\\\\\ \n', str));
end
fprintf(fid, '\\bottomrule\n');
fprintf(fid, '\\end{tabular}\n');
fprintf(fid, '\\end{center}\n');
fprintf(fid, '\\end{table}\n');
fclose(fid);
end






