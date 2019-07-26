%% Data conversion

q = dataconv('rankingcandidates.dat');

%%  Plurality Vote Method

Hillary = plurality(1)
Bernie = plurality(2)
John = plurality(3)
Ted = plurality(4)
Donald = plurality(5)

x = ["The winner based on the plurality ranking method is Bernie"];
display(x)

%% Average Rank Method
   
Hillary = averageRank(1)
Bernie = averageRank(2)
John = averageRank(3)
Ted = averageRank(4)
Donald = averageRank(5)

x = ["The winner based on the average ranking method is Hillary"];
display(x)

%% Borda Count Method

Hillary = borda(1)
Bernie = borda(2)
John = borda(3)
Ted = borda(4)
Donald = borda(5)

x = ["The winner based on the Borda Count method is Hillary "];
display(x)

%% W-Borda Count Method

Hil = w_borda(1);
Ber = w_borda(2);
Joh = w_borda(3);
Ted = w_borda(4);
Don = w_borda(5);


Hillary = Hil(1)
Bernie = Ber(1)
John = Joh(1)
Ted = Ted(1)
Donald = Don(1)

x = ["The winner based on the W-Borda Count method with W1 [5,4,3,2,1] is Hillary"];
display(x)



Hillary = Hil(2)
Bernie = Ber(2)
John = Joh(2)
%Ted = Ted(2)
Donald = Don(2)

x = ["There is no winner based on the W-Borda Count method with W2 [5,5,5,5,5] since the candidates got equal scores"];
display(x)



Hillary = Hil(3)
Bernie = Ber(3)
John = Joh(3)
%Ted = Ted(3)
Donald = Don(3)

x = ["The winner based on the W-Borda Count method with W3 [100,75,50,25,0] is Hillary"];
display(x)



Hillary = Hil(4)
Bernie = Ber(4)
John = Joh(4)
%Ted = Ted(4)
Donald = Don(4)

x = ["The winner based on the W-Borda Count method with W4 [500,400,300,200,100] is Hillary"];
display(x)



Hillary = Hil(5)
Bernie = Ber(5)
John = Joh(5)
%Ted = Ted(5)
Donald = Don(5)

x = ["The winner based on the W-Borda Count method with W5 [1, 4/5, 3/5, 2/5, 1/5] is Hillary"];
display(x)

%% PageRank Method

v = 'rankingcandidates.dat';
A = adj(v); 


for i = 1:5 
    d = sum(A(:,i));
    
    for z = 1:5
        if A(z,i)~=0
            A(z,i) = A(z,i)/d; 
        end
    end
end

[V,D] = eig(A);

rank_ = V(:,1)/sum(V(:,1)); 

rank_

x = ["the winner with respect to PageRank method is Hillary"];
display(x)

%% Functions

% Plurality Vote Method

function y = plurality(j)

B = dataconv('rankingcandidates.dat');
candidate = 0;
for i = 1:240    
    if B(i,j) == 1      
        candidate = candidate + 1;  
    end
    
end
y = candidate;

end

%  Average Ranking Method 

function [y] = averageRank(j)

B = dataconv('rankingcandidates.dat');
candidate = 0;
candidate = sum(B(:,j));
y = (candidate/240); 

end

%  Borda Count Method 

function y = borda(j)

B = dataconv('rankingcandidates.dat');
candidate = 0;

for i = 1:240 
    for n = 1:4 
        if B(i,j) == n
            candidate = candidate + (5-n);            
        end
    end
end

y = candidate;

end

%  W - Borda Count Method 

function [y] = w_borda(j)

B = dataconv('rankingcandidates.dat');
candidate1 = 0; candidate2 = 0; candidate3 = 0; candidate4 = 0; candidate5 = 0;

W1 = [5,4,3,2,1]; W2 = [5,5,5,5,5]; W3 = [100,75,50,25,0]; 

W4 = [500,400,300,200,100]; W5 = [1, 4/5, 3/5, 2/5, 1/5];


for i = 1:240  
    for n = 1:5 
        
        if B(i,j) == n 
            
            candidate1 = candidate1 + W1(n); 
            
            candidate2 = candidate2 + W2(n); 
            
            candidate3 = candidate3 + W3(n); 
            
            candidate4 = candidate4 + W4(n); 
            
            candidate5 = candidate5 + W5(n); 
            
        end
    end
end

y = [candidate1,candidate2,candidate3,candidate4,candidate5];



end

% Importing data (indeces)

function y = dataconv(x)

A = importdata(x);

for i = 1:240
    
    C(i,:) = cell2mat(A(i,1)); 
    J(i,:) = split(C(i,:),', ');
    
end

B = zeros(240,5);

for i = 1:240
    
    [k,l] = find(strcmp(J(i,:),'HC')); 
    
    [t,v] = find(strcmp(J(i,:),'BS')); 
    
    [r,s] = find(strcmp(J(i,:),'JK')); 
    
    [e,z] = find(strcmp(J(i,:),'TC')); 
    
    [o,u] = find(strcmp(J(i,:),'DT')); 
    
    B(i,1) = l; B(i,2) = v; B(i,3) = s; B(i,4) = z; B(i,5) = u;
    
end

y = B;

end

% Importing data (vote rank)

function y = dataconv_r(x)

A = importdata(x);

for i = 1:240
    
    C(i,:) = cell2mat(A(i,1)); 
    J(i,:) = split(C(i,:),', ');
    
end

B = zeros(240,5);

for i = 1:240
    
    [k,l] = find(strcmp(J(i,:),'HC')); 
    
    [t,v] = find(strcmp(J(i,:),'BS')); 
    
    [r,s] = find(strcmp(J(i,:),'JK')); 
    
    [e,z] = find(strcmp(J(i,:),'TC')); 
    
    [o,u] = find(strcmp(J(i,:),'DT')); 
    
    B(i,1) = 6 - l; B(i,2) = 6 - v; B(i,3) = 6 - s; B(i,4) = 6 - z; 
    B(i,5) = 6 - u;
    
end

y = B;

end

% PageRank (Adjacency matrix)

function y = adj(x)

B = dataconv_r(x);

A = zeros(5,5);

for r = 1:240
    for i = 1:4
        for j = i+1:5
            if B(r,i) > B(r,j)
                A(i,j) = A(i,j) + 1;
            elseif B(r,i) < B(r,j)
                A(j,i) = A(j,i) + 1;
            elseif B(r,i) == B(r,j)
                A(i,i) = A(i,i) + 0;
            end
        end
    end
end

y = A;
end
   