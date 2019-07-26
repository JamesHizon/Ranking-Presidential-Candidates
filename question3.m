% Goal: To use SVD's or a network to decide the ranking of difficulty.

% Exam: m (i=1,...,m) questions, n (j=1,...,n) students of MATH 16000.
% All grades in a n x m matrix G s.t.
% Gij: the grade obtained by student i on question j.

% Task: Assign a difficulty score/rating to each question based on the
% available data.


data = importdata('examscores.dat');
[n, m] = size(data); % nxm matrix of grades

% Note: Use top singular value decomposition to get score vector.
% SVD decomposition for data matrix
[U, S, V] = svd(data); 

% Ranking -> column of V
% First column -> strongest fit.
% Grade weight: square of singular value
svd_score = -V(:,1); % Negative b/c U(:,1) is negative
[temp, svd_ranking] = sort(svd_score, 'ascend');

% Massey's method
X = zeros(n*m*(m-1)/2, m); % Incidence matrix
y = zeros(n*m*(m-1)/2, 1); % Point differential vector
% Compare each pair of questions from each row
index = 1;
for i=1:n % n students
    for j=1:m % m questions
        for k=(j+1):m % All other questions k
            if(data(i,j) > data(i,k))
                X(index, j) = -1;
                X(index, k) = 1;
                y(index) = data(i,j) - data(i,k);
                index = index + 1;
            elseif(data(i,j) < data(i,k))
                X(index, j) = 1;
                X(index, k) = -1;
                y(index) = -data(i,j) + data(i,k);
                index = index + 1;
            else
                X(index, j) = -1;
                X(index, k) = 1;
                y(index) = 0;
                index = index + 1;
            end
        end
    end
end

% Compute:
massey_matrix = X' * X; 
d = X' * y;

% Make full rank. Add last row of all 1's.
massey_matrix(m,:) = 1;
d(m) = 0;
% hardest = 1, easiest = 7
massey_score = inv(massey_matrix) * d;
[temp, massey_ranking] = sort(massey_score, 'descend'); 

% print out the rankings for each method
display('SVD Scores and Ranks (Lower Score/Higher Rank = Harder Problem)')
display([svd_score'; svd_ranking'])

display('Massey Scores and Ranks (Higher Score/Higher Rank = Harder Problem)')
display([massey_score'; massey_ranking'])

