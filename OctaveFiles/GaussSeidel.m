clear;clc
format compact
%%Input your square matrix_type
A = [-6 2 1 2 1;
      3 8 -4 1 0;
      -1 1 4 10 1;
      3 -4 1 9 2;
      2 0 1 3 10]; %coefficients matrix_type
C = [3;4;-2;12;1];
n = length(C);
X = zeros(n,1);
Error_eval = ones(n,1);

for i =1:n
    j = 1:n;
    j(i) = [];
    B = abs(A(i,j));
    Check(i) = abs(A(i,i)) - sum(B);
    if Check(i) < 0
      fprintf('Matrix not diagonal')
    end
end

iteration = 0;
while max(Error_eval) > 0.001
    iteration = iteration + 1;
    Z = X;  % save current values to calculate error later
    for i = 1:n
        j = 1:n; % define an array of the coefficients' elements
        j(i) = [];  % eliminate the unknow's coefficient from the remaining coefficients
        Xtemp = X;  % copy the unknows to a new variable
        Xtemp(i) = [];  % eliminate the unknown under question from the set of values
        X(i) = (C(i) - sum(A(i,j) * Xtemp)) / A(i,i);
    end
    Xsolution(:,iteration) = X;
    Error_eval = sqrt((X - Z).^2);
end

%% Display Results
GaussSeidelTable = [1:iteration;Xsolution]'
MaTrIx = [A X C]