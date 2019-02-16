clear all
% to load the data set 
T = xlsread('E:\GUC Materials\semester 10\machine learning\practical assignments\assign 1\house_prices_data_training_data.csv');

Alpha=.01; % learning rate 

m=length(T); %number of training examples 
U=T(:,(4:20));  % features vector ( rows = m , cols = n ) 

X= [ones(m,1) U]; %hypothesis(1) 

n=length(X(1,:)); 


for w=2:n
    if max(abs(X(:,w)))~=0
    X(:,w)=(X(:,w)-mean((X(:,w))))./std(X(:,w));
    end
end

Y=T(:,3)/mean(T(:,3));  % actual output 
Theta=zeros(n,1);       % parameters vector 

k=1;           % for iteration 

E(k)=(1/(2*m))*sum((X*Theta-Y).^2);  % cost function 

R=1;  % for the loop 

while R==1
Alpha=Alpha*1;
Theta=Theta-(Alpha/m)*X'*(X*Theta-Y);
k=k+1
E(k)=(1/(2*m))*sum((X*Theta-Y).^2);
if E(k-1)-E(k)<0
    break
end 
q=(E(k-1)-E(k))./E(k-1);
if q <.000001;
    R=0;
end
end

figure(1)
plot(E)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

X2=[ones(m,1) U U.^2]; %hypothesis(2)

n2=length(X2(1,:));
for w2=2:n2
    if max(abs(X2(:,w2)))~=0
    X2(:,w2)=(X2(:,w2)-mean((X2(:,w2))))./std(X2(:,w2));
    end
end


Theta2=zeros(n2,1);
k2=1;

E2(k2)=(1/(2*m))*sum((X2*Theta2-Y).^2);

R2=1;
while R2==1

Theta2=Theta2-(Alpha/m)*X2'*(X2*Theta2-Y);
k2=k2+1
E2(k2)=(1/(2*m))*sum((X2*Theta2-Y).^2);
if E2(k2-1)-E2(k2)<0
    break
end 
q2=(E2(k2-1)-E2(k2))./E2(k2-1);
if q2 <.000001;
    R2=0;
end
end

figure(2)
plot(E2)
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
X3= [ones(m,1) U U.^2 U.^3];  %hypothesis(3)

n3=length(X3(1,:));

for w3=2:n3
    if max(abs(X3(:,w3)))~=0
    X3(:,w3)=(X3(:,w3)-mean((X3(:,w3))))./std(X3(:,w3));
    end
end

Theta3=zeros(n3,1);
k3=1;

E3(k3)=(1/(2*m))*sum((X3*Theta3-Y).^2);

R3=1;
while R3==1

Theta3=Theta3-(Alpha/m)*X3'*(X3*Theta3-Y);
k3=k3+1
E3(k3)=(1/(2*m))*sum((X3*Theta3-Y).^2);
if E3(k3-1)-E3(k3)<0
    break
end 
q3=(E3(k3-1)-E3(k3))./E3(k3-1);
if q3 <.000001;
    R3=0;
end
end

figure(3)
plot(E3)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
X4=[ones(m,1) U U.^2 U.^3 U.^4]; %hypothesis(4)

n4=length(X4(1,:));

for w4=2:n4
    if max(abs(X4(:,w4)))~=0
    X4(:,w4)=(X4(:,w4)-mean((X4(:,w4))))./std(X4(:,w4));
    end
end

Theta4=zeros(n4,1);
k4=1;

E4(k4)=(1/(2*m))*sum((X4*Theta4-Y).^2);

R4=1;
while R4==1

Theta4=Theta4-(Alpha/m)*X4'*(X4*Theta4-Y);
k4=k4+1
E4(k4)=(1/(2*m))*sum((X4*Theta4-Y).^2);
if E4(k4-1)-E4(k4)<0
    break
end 
q4=(E4(k4-1)-E4(k4))./E4(k4-1);
if q4 <.000001;
    R4=0;
end
end


figure(4)
plot(E4)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% normal function 

thetanormal1=inv(transpose(X)*X)*transpose(X)*Y;

thetanormal2=inv(transpose(X2)*X2)*transpose(X2)*Y;

thetanormal3=inv(transpose(X3)*X3)*transpose(X3)*Y;

thetanormal4=inv(transpose(X4)*X4)*transpose(X4)*Y;





