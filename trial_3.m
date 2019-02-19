Data = xlsread('E:\GUC Materials\semester 10\machine learning\practical assignments\assign 2\heart_DD.csv');

Alpha=.0001; % learning rate 

m=length(Data); %number of training examples 
U=Data(:,(1:13));  % features vector ( rows = m , cols = n )

X= [ones(m,1) U ]; %hypothesis(1) 

n=length(X(1,:)); % number of features 

% feature scaling 
for w=2:n
    if max(abs(X(:,w)))~=0
    X(:,w)=(X(:,w)-mean((X(:,w))))./std(X(:,w));
    end
end

Y=Data(:,14)/mean(Data(:,14));  % actual output scaled 

Theta=zeros(n,1);       % parameters vector 


H = (1./(1+exp(-1*(X*Theta)))) ; 
% cost =(-Y*log(H))-((1-Y)*log(1-H)) ;

cost = zeros(250,1) ;
for counter= 1:1:250 
    
  if Y(counter,1)  == 0 
      cost(counter,1)=(-1*log(1-H(counter,1))) ;
  end 
  if Y(counter,1)  == 1
      cost(counter,1)=(-1*log(H(counter,1))) ;
  end 
  
end 

k=1;           % for iteration 

E(k)=(1/m)*sum(cost);  % cost function 

R=1;  % for the loop 

while R==1
Alpha=Alpha*1;


Theta=Theta-((Alpha/m)*((H-Y)'*X)');

k=k+1 ;

H = (1./(1+exp(-1*(X*Theta)))) ; 
for counter=1:250 
    
  if Y(counter,1)  == 0 
      cost(counter,1)=(-1*log(1-H(counter,1))) ;
  end 
  if Y(counter,1) == 1 
      cost(counter,1)=(-1*log(H(counter,1))) ;
  end  
end 

E(k)=(1/m)*sum(cost);

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

% hypo 2 

X2= [ones(m,1) U.^4 U.^2 ];  

n2=length(X2(1,:)); % number of features 

% feature scaling 
for w2=2:n2
    if max(abs(X2(:,w2)))~=0
    X2(:,w2)=(X2(:,w2)-mean((X2(:,w2))))./std(X2(:,w2));
    end
end

Theta2=zeros(n2,1);       % parameters vector 


H2 = (1./(1+exp(-1*(X2*Theta2)))) ; 
% cost =(-Y*log(H))-((1-Y)*log(1-H)) ;

cost2 = zeros(250,1) ;
for counter2= 1:1:250 
    
  if Y(counter2,1)  == 0 
      cost2(counter2,1)=(-1*log(1-H2(counter2,1))) ;
  end 
  if Y(counter2,1)  == 1
      cost(counter2,1)=(-1*log(H2(counter2,1))) ;
  end 
  
end 

k2=1;           % for iteration 

E2(k2)=(1/m)*sum(cost2);  % cost function 

R2=1;  % for the loop 

while R2==1
Alpha=Alpha*1;


Theta2=Theta2-((Alpha/m)*((H2-Y)'*X2)');

k2=k2+1 ;

H2 = (1./(1+exp(-1*(X2*Theta2)))) ; 
for counter2=1:250 
    
  if Y(counter2,1)  == 0 
      cost2(counter2,1)=(-1*log(1-H2(counter2,1))) ;
  end 
  if Y(counter2,1) == 1 
      cost2(counter2,1)=(-1*log(H2(counter2,1))) ;
  end  
end 

E2(k2)=(1/m)*sum(cost2);

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

