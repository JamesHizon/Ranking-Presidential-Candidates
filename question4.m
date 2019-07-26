data = importdata('mandril.mat');
map = data.map;
data = data.X;
[n, m] = size(data); 

[U, S, V] = svd(data);
figure
image(data); colormap(map);


figure
stem(diag(S))
grid on

% plot image at different ranks
ranks = [1, 6, 11, 31];
figure
colormap(map);
for i=1:4
    subplot(2,2,i);
    image(U(:,1:ranks(i)) * S(1:ranks(i), 1:ranks(i)) * V(:,1:ranks(i))');
    title(strcat('Rank:', ' ', num2str(ranks(i))))
end


% display image of residuals
ranks = [1, 6, 11, 31];
figure
colormap(map);
for i=1:4
    subplot(2,2,i);
    image(data - U(:,1:ranks(i)) * S(1:ranks(i), 1:ranks(i)) * V(:,1:ranks(i))');
    title(strcat('Rank:', ' ', num2str(ranks(i))))
end

% print a table of the relative error of the residual l2 norm to s^(k+1)
ranks = [1, 6, 11, 31];
errors = zeros(4,1);
for i=1:4
    % calculate the residual l2 norm
    res_l2 = norm(data - U(:,1:ranks(i))*S(1:ranks(i),1:ranks(i))*V(:,1:ranks(i))');
    % calculate the next highest singular value
    s_k1 = S(ranks(i)+1,ranks(i)+1);
    % calculate relative error
    errors(i) = abs(s_k1-res_l2)/s_k1;
end
