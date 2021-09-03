%Vaibhav Bisht (vb268@cornell.edu).
%MAE 5730 (Intermediate Dynamics).
%Homework-1, 9/3/2021.

clc
clear variables;
close all;

% ---------- 4. GENERATE SOLUTION ---------

tspan = 0:0.01:1;

% X-Axis
xo = [0 38.62];
[t,x] = ode45('funcx', tspan, xo); 

%Y-Axis
yo = [0 -3.686];
[t,y] = ode45('funcy', tspan, yo);

%Z-Axis
zo = [0 0];
[t,z] = ode45('funcz', tspan, zo);

%Functions 'funcx', 'funcy' and. 'funcz' for obtaining solution using ode45 are 
%defined in the end.

%Constraining to dimensions of pitch.
a=0;
l = length(y(:,1));
for i=1:l
    if y(i,1)>-1.88
        a = a+1;
    end
end

for j=1:a
    X(j) = x(j,1);
    Y(j) = y(j,1);
    Z(j) = z(j,1);
end

%--------- 5 & 6. PLOT & ANIMATE THE SOLUTION ---------


    Curve = plot3(X, Y, Z, 'b-','MarkerSize',10);
    %The 'axis', 'xlabel', 'ylabel' and 'zlabel' commands can be 
    %modified/removed as per viewing requirements.
    axis([0 13 -1.88 0 0 0.2]);
    xlabel('X (Along the length of the pitch)');
    ylabel('Y (Along the height of the bowler)');
    zlabel('Z (Deviation due to crosswind)');
    %pause(0.1)

%Functions used by ode45 to derive curve for all three directions.

% Along X-Axis
function pdotx = funcx(t,x)
    pdotx  = zeros(size(x));
    pdotx(1) = x(2);
    pdotx(2) = -0.00816*x(2)^2;
end

% Along Y-Axis
function pdoty = func5(t,x)
    pdoty  = zeros(size(x));
    pdoty(1) = x(2);
    pdoty(2) = 0.00816*x(2)^2 - 9.8;
end

%Along Z-Axis
function pdotz = funcz(t,x)
    pdotz  = zeros(size(x));
    pdotz(1) = x(2);
    pdotz(2) = 0.816;
end