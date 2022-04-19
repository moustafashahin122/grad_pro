%==========================================================================
%                              LINE DATA [Ohm]
%==========================================================================
%branch no sending  reciving  R(Ohm)     X(Ohm)
%==========================================================================
LD =[ 1.0000    1.0000    2.0000    0.0563    0.0315
    2.0000    2.0000    3.0000    0.0716    0.0260
    3.0000    3.0000    4.0000    0.0186    0.0067
    4.0000    4.0000    5.0000    0.0556    0.0202
    5.0000    5.0000    6.0000    0.0530    0.0192
    6.0000    6.0000    7.0000    0.0530    0.0192
    7.0000    7.0000    8.0000    0.0212    0.0077
    8.0000    8.0000    9.0000    0.1007    0.0366
    9.0000    9.0000   10.0000    0.0450    0.0164
   10.0000   10.0000   11.0000    0.0398    0.0144
   11.0000   11.0000   12.0000    0.1113    0.0404
   12.0000   12.0000   13.0000    0.0132    0.0048
   13.0000    2.0000   14.0000    0.0636    0.0231
   14.0000   14.0000   15.0000    0.0716    0.0260
   15.0000   15.0000   16.0000    0.0265    0.0096
   16.0000   16.0000   17.0000    0.0106    0.0038
   17.0000   17.0000   18.0000    0.0927    0.0337
   18.0000   18.0000   19.0000    0.0106    0.0038
   19.0000   19.0000   20.0000    0.0265    0.0096
   20.0000   20.0000   21.0000    0.0450    0.0164
   21.0000   21.0000   22.0000    0.0530    0.0192
   22.0000   22.0000   23.0000    0.0530    0.0192
   23.0000   23.0000   24.0000    0.0663    0.0240
   24.0000   24.0000   25.0000    0.2253    0.0818
   25.0000   25.0000   26.0000    0.0265    0.0096
   26.0000   26.0000   27.0000    0.0265    0.0096
   27.0000   27.0000   28.0000    0.0133    0.0048
   28.0000   28.0000   29.0000    0.1723    0.0625
   29.0000   29.0000   30.0000    0.0080    0.0029];
%==========================================================================
%                         BUS DATA [kW and kVar]
%              bus_number      P(kw)                     Q(kVAR)
  BD1=[    1	            0	    0
                 2	            2875 1814
                 3	            1100 695
                 4	            1100 695
                 5	            899 568
                 6	            770 486
                 7	            668 423
                 8	            598 378
                 9	            546 345
                 10	            380 240
                 11	            210 132
                 12	            94.586 59.368
                 13          	34.423 21.518
                 14          	1772 1118
                 15             1640 1035
                 16             1452 915
                 17             1434 904
                 18             1212 765
                 19             1086 685
                 20             953 602
                 21             827 521
                 22             716 452
                 23             550 347
                 24             434 273
                 25             346 218
                 26             316 199
                 27             184 116
                 28             139 87.911
                 29             113 71.734
                 30             34.25 21.734];  
%==========================================================================     
BD=[BD1(:,1) BD1(:,2)-PP_Size_KW BD1(:,3)-QQ_Size_kVAR];     
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

