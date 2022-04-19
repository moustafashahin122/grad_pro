% clc
% clear all
%==========================================================================
%                              LINE DATA [Ohm]
%==========================================================================
%branch no sending  reciving  R(Ohm)     X(Ohm)
%==========================================================================
LD = [1 1 2 0.1170 0.0480
    2 2 3 0.1072 0.0440
    3 3 4 0.1645 0.0457
    4 4 5 0.1495 0.0415
    5 5 6 0.1495 0.0415
    6 6 7 0.3144 0.0540
    7 7 8 0.2096 0.0360
    8 8 9 0.3144 0.0540
    9 9 10 0.2096 0.0360
    10 10 11 0.1310 0.0225
    11 11 12 0.1048 0.0180
    12 3 13 0.1572 0.0270
    13 13 14 0.2096 0.0360
    14 14 15 0.1048 0.0180
    15 15 16 0.0524 0.0090
    16 6 17 0.1794 0.0498
    17 17 18 0.1645 0.0457
    18 18 19 0.2079 0.0473
    19 19 20 0.1890 0.0430
    20 20 21 0.1890 0.0430
    21 21 22 0.2620 0.0450
    22 22 23 0.2620 0.0450
    23 23 24 0.3144 0.0540
    24 24 25 0.2096 0.0360
    25 25 26 0.1310 0.0225
    26 26 27 0.1048 0.0180
    27 7 28 0.1572 0.0270
    28 28 29 0.1572 0.0270
    29 29 30 0.1572 0.0270
    30 10 31 0.1572 0.0270
    31 31 32 0.2096 0.0360
    32 32 33 0.1572 0.0270
    33 33 34 0.1048 0.0180];

%==========================================================================
%                         BUS DATA [kW and kVar]
%==========================================================================
  % bus no     activepower   reactivepower
BD1=[1	0	0
    2	230	142.5
    3	0	0
    4	230	142.5
    5	230	142.5
    6	0 0
    7	0	0
    8	230	142.5
    9	230	142.5
    10	0	0
    11	230	142.5
    12	137	84
    13	72	45
    14	72	45
    15	72	45
    16	13.5	7.5
    17	230	142.5
    18	230	142.5
    19	230	142.5
    20	230	142.5
    21	230	142.5
    22	230	142.5
    23	230	142.5
    24	230	142.5
    25	230	142.5
    26	230	142.5
    27	137	85
    28	75	48
    29	75	48
    30	75	48
    31	57	34.5
    32	57	34.5
    33	57	34.5
    34	57	34.5];
%==========================================================================     
BD=[BD1(:,1) BD1(:,2)-Qcc1_Size_Kvar BD1(:,3)];     
%==========================================================================    
br=length(LD);
no=length(BD);
%==========================================================================
MVAb=100;
KVb=11;
Zb=(KVb^2)/MVAb;
%==========================================================================
%                              Per Unit Values
%==========================================================================
R=(LD(:,4))/Zb;
X=(LD(:,5))/Zb;
P=(BD(:,2))./(1000*MVAb);
Q=(BD(:,3))./(1000*MVAb);
%==========================================================================
F=LD(:,2:3);
M=max(LD(:,2:3));
N=max(M);
f1=[1:N]';
for i=1:N
    g1=find(F(:,:)==i);
    h1(i)=length(g1);
end
k1(:,1)=f1;
k1(:,2)=h1';
cent=1;                                      % cent=input('central bus  ');
  %========================================================================
  % this section of the code is to adjust line data to the standard 
  %========================================================================
  NLD=zeros(N,size(LD,2));
  c=find(LD(:,2:3)==cent);
  NLD=LD(c,:);
  LD(c,:)=[];
  t=find(k1(:,1)==cent);
  k1(t,2)=k1(t,2)-size(c,1);
  j=size(c,1);
  i=1;
  while sum(k1(:,2))>0
        c=[];
        b=[];
        t=[];
        [c e]=find(LD(:,2:3)==NLD(i,3));
        if size(c,2)~=0
           b=LD(c,:);
           LD(c,:)=[];
           t=find(k1(:,1)==NLD(i,3));
           k1(t,2)=k1(t,2)-(size(c,1)+1);
           d=find(b(:,3)==NLD(i,3));
           b(d,2:3)=[b(d,3),b(d,2)];
           NLD(j+1:j+size(c,1),:)=b;
           j=j+size(c,1);
        end
        i=i+1;
  end
  LD=sortrows(NLD,3);
  %========================================================================
  % end the data is represented in standard format
%==========================================================================
%             Code for  bus-injection to branch-current matrix
%==========================================================================
bibc=zeros(size(LD,1),size(LD,1));
for i=1:size(LD,1)
    if LD(i,2)==1
      bibc(LD(i,3)-1,LD(i,3)-1)=1;
    else
       bibc(:,LD(i,3)-1)=bibc(:,LD(i,2)-1);
       bibc(LD(i,3)-1,LD(i,3)-1)=1;
    end
end
S=complex(P,Q);                                 % complex power
Vo=ones(size(LD,1),1);% initial bus votage% 10 change to specific data value
S(1)=[];
VB=Vo;
iteration=100;
% iteration=input('number of iteration : ');
%==========================================================================
for ip=1:iteration
    %======================================================================
    %                           Backward Sweep
    %=====================================================================
    I=conj(S./VB);                                       % injected current
    Z=complex(R,X);                           %branch impedance
    ZD=diag(Z);                                        %makeing it diagonal
    IB=bibc*I;                                              %branch current
    %======================================================================
    %                           Forward Sweep
    %======================================================================
    TRX=bibc'*ZD*bibc;
    VB=Vo-TRX*I;
end
%==========================================================================
Vbus=[1;VB];
% display(Vbus);
% display(IB);
V_bus=abs(Vbus);
I_Line=abs(IB);
%==========================================================================
%                               Power Loss
%==========================================================================
Ibrp=[abs(IB) angle(IB)*180/pi];
PLL(1,1)=0;
QLL(1,1)=0;
% losses
for f2=1:size(LD,1)
    Pl(f2,1)=(Ibrp(f2,1)^2)*R(f2,1);
    Ql(f2,1)=X(f2,1)*(Ibrp(f2,1)^2);
    PLL(1,1)=PLL(1,1)+Pl(f2,1);
    QLL(1,1)=QLL(1,1)+Ql(f2,1);
end
%==========================================================================
Plosskw=(Pl)*100000;
Qlosskw=(Ql)*100000;
PLoss=(PLL)*100000;
QLoss=(QLL)*100000;
%==========================================================================

