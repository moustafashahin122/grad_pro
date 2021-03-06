clear all
clc

Networks;


%==========================================================================
%case 1 DGs at unity power factor
%==========================================================================

% caps_locations =
% 
%      []
% 
% 
% caps_sizes =
% 
%      []
% 
% 
% caps_tot_size =
% 
%      0
% 
% 
% DGs_locations =
% 
%     21    25
% 
% 
% DGs_sizes =
% 
%    1.0e+03 *
% 
%     1.9999    2.0000
% 
% 
% DGs_tot_size =
% 
%    3.9999e+03
% 
% 
% V_min =
% 
%     0.9669
% 
% 
% V_max =
% 
%      1
% 
% 
% Total_PLoss =
% 
%   542.4591
% 
% 
% Total_QLoss =
% 
%   249.0491
% 
% 
% over_all_power_factor =
% 
%     0.7932
% 
% 
% min_conv =
% 
%   542.4591
% 
% 
case_1_conv =[

  558.0853
  558.0853
  558.0853
  558.0853
  558.0853
  558.0853
  558.0853
  558.0853
  558.0853
  558.0853
  558.0853
  558.0853
  558.0853
  558.0853
  558.0853
  555.1708
  550.0313
  546.7217
  544.8816
  544.8458
  544.8458
  544.8458
  543.7912
  543.7912
  543.7912
  543.4168
  543.4168
  543.4168
  543.4168
  543.3100
  543.3100
  543.3100
  543.3100
  543.3025
  543.3025
  543.2228
  543.2228
  542.8791
  542.7399
  542.7399
  542.6556
  542.6556
  542.6269
  542.5738
  542.5364
  542.4913
  542.4707
  542.4636
  542.4591
  542.4591];


case_1_v =[

    1.0000
    0.9874
    0.9826
    0.9816
    0.9792
    0.9774
    0.9760
    0.9755
    0.9742
    0.9739
    0.9737
    0.9736
    0.9736
    0.9808
    0.9746
    0.9728
    0.9722
    0.9687
    0.9684
    0.9680
    0.9678
    0.9671
    0.9669
    0.9669
    0.9681
    0.9679
    0.9677
    0.9677
    0.9674
    0.9674];


%==========================================================================
%case 2 DGs at .9 power factor
%==========================================================================
% caps_locations =
% 
%      []
% 
% 
% caps_sizes =
% 
%      []
% 
% 
% caps_tot_size =
% 
%      0
% 
% 
% DGs_locations =
% 
%     25    21
% 
% 
% DGs_sizes =
% 
%    1.0e+03 *
% 
%     2.0000    2.0000
% 
% 
% DGs_tot_size =
% 
%    4.0000e+03
% 
% 
% V_min =
% 
%     0.9699
% 
% 
% V_max =
% 
%      1
% 
% 
% Total_PLoss =
% 
%   458.8573
% 
% 
% Total_QLoss =
% 
%   213.5627
% 
% 
% over_all_power_factor =
% 
%     0.8335
% 
% 
% min_conv =
% 
%   458.8573
% 
% 
case_2_conv =[

  473.3394
  473.3394
  473.3394
  473.3394
  473.3394
  473.3394
  473.3394
  473.3394
  473.3394
  473.3394
  473.3394
  473.3394
  473.3394
  473.3394
  473.3394
  469.6553
  466.5008
  464.1322
  462.6509
  462.6509
  462.6509
  462.6509
  462.6509
  462.6509
  462.6509
  462.6509
  462.6509
  462.6509
  462.6509
  461.9851
  461.1362
  459.8829
  459.8829
  459.4564
  459.3158
  459.3158
  459.3158
  459.2596
  459.2146
  459.2146
  459.2130
  459.0552
  459.0552
  458.9500
  458.9500
  458.9500
  458.8698
  458.8603
  458.8573
  458.8573];
% 
% 
case_2_v =[

    1.0000
    0.9879
    0.9832
    0.9822
    0.9797
    0.9779
    0.9765
    0.9761
    0.9748
    0.9744
    0.9743
    0.9741
    0.9741
    0.9817
    0.9760
    0.9744
    0.9739
    0.9709
    0.9707
    0.9705
    0.9705
    0.9700
    0.9699
    0.9701
    0.9720
    0.9718
    0.9716
    0.9716
    0.9713
    0.9713];
% 
% 
% minee =
% 
%     0.9699
% 
% 
% minbus =
% 
%     23
%==========================================================================
%case 3 caps only
%==========================================================================
% caps_locations =
% 
%     26    21     8    18
% 
% 
% caps_sizes =
% 
%    1.0e+03 *
% 
%     0.9638    1.1989    0.7829    1.0544
% 
% 
% caps_tot_size =
% 
%    4.0000e+03
% 
% 
% DGs_locations =
% 
%      []
% 
% 
% DGs_sizes =
% 
%      []
% 
% 
% DGs_tot_size =
% 
%      0
% 
% 
% V_min =
% 
%     0.9521
% 
% 
% V_max =
% 
%      1
% 
% 
% Total_PLoss =
% 
%   665.3252
% 
% 
% Total_QLoss =
% 
%   300.5425
% 
% 
% over_all_power_factor =
% 
%     0.9108
% 
% 
% min_conv =
% 
%   665.3252
% 
% 
case_3_conv =[

  677.6509
  677.6509
  677.6509
  670.7564
  670.7564
  670.7564
  670.7564
  670.7564
  670.7564
  670.7564
  670.7564
  670.7564
  670.7564
  670.7564
  670.7564
  669.9601
  668.3290
  667.8481
  667.8481
  667.6610
  667.4838
  667.2499
  666.8115
  666.4841
  666.4841
  665.8521
  665.8521
  665.6245
  665.6245
  665.6245
  665.5951
  665.5951
  665.4982
  665.3664
  665.3664
  665.3664
  665.3630
  665.3630
  665.3630
  665.3630
  665.3332
  665.3332
  665.3315
  665.3287
  665.3275
  665.3275
  665.3259
  665.3259
  665.3252
  665.3252];
% 
% 
case_3_v =[

    1.0000
    0.9865
    0.9819
    0.9809
    0.9786
    0.9769
    0.9757
    0.9753
    0.9740
    0.9736
    0.9735
    0.9734
    0.9733
    0.9783
    0.9704
    0.9679
    0.9671
    0.9612
    0.9606
    0.9595
    0.9581
    0.9566
    0.9556
    0.9547
    0.9526
    0.9525
    0.9524
    0.9523
    0.9521
    0.9521];
% 
% 
% minee =
% 
%     0.9521
% 
% 
% minbus =
% 
%     30
%==========================================================================
%case 4 DG unity and caps 
%==========================================================================


% caps_locations =
% 
%     11    25
% 
% 
% caps_sizes =
% 
%    1.0e+03 *
% 
%     0.4953    1.1626
% 
% 
% caps_tot_size =
% 
%    1.6579e+03
% 
% 
% DGs_locations =
% 
%     22    25    18
% 
% 
% DGs_sizes =
% 
%    1.0e+03 *
% 
%     1.4583    1.3743    1.1674
% 
% 
% DGs_tot_size =
% 
%    4.0000e+03
% 
% 
% V_min =
% 
%     0.9682
% 
% 
% V_max =
% 
%      1
% 
% 
% Total_PLoss =
% 
%   474.8795
% 
% 
% Total_QLoss =
% 
%   220.0919
% 
% 
% over_all_power_factor =
% 
%     0.8277
% 
% 
% min_conv =
% 
%   474.8795
% 
% 
case_4_conv =[

  527.7650
  527.7650
  527.7650
  527.0965
  517.1436
  517.1436
  513.7833
  513.7833
  513.7833
  513.7833
  513.7833
  513.7833
  513.7833
  513.7833
  513.7833
  513.2775
  511.5836
  511.2641
  498.0125
  494.3490
  490.7085
  488.0273
  482.1127
  480.9604
  479.8775
  478.3384
  478.3384
  478.1938
  477.9442
  477.9442
  477.9442
  477.9442
  477.9442
  477.7318
  476.7149
  476.2780
  475.5374
  475.3949
  475.3949
  475.3949
  475.3949
  475.3178
  475.1664
  475.1119
  474.9422
  474.8987
  474.8864
  474.8863
  474.8795
  474.8795];
% 
% 
case_4_v =[

    1.0000
    0.9879
    0.9832
    0.9822
    0.9799
    0.9781
    0.9768
    0.9764
    0.9753
    0.9750
    0.9749
    0.9748
    0.9748
    0.9815
    0.9756
    0.9739
    0.9734
    0.9701
    0.9698
    0.9693
    0.9688
    0.9687
    0.9683
    0.9682
    0.9690
    0.9688
    0.9687
    0.9686
    0.9684
    0.9684];
% 
% 
% minee =
% 
%     0.9682
% 
% 
% minbus =
% 
%     24

%==========================================================================
%case 5 DG pf .9 and caps only
%==========================================================================


% caps_locations =
% 
%     18     4
% 
% 
% caps_sizes =
% 
%    1.0e+03 *
% 
%     1.2000    0.6308
% 
% 
% caps_tot_size =
% 
%    1.8308e+03
% 
% 
% DGs_locations =
% 
%     23    21    26
% 
% 
% DGs_sizes =
% 
%    1.0e+03 *
% 
%     0.6877    1.8731    1.4392
% 
% 
% kvar =
% 
%   333.0527  907.1959  697.0208
% 
% 
% DGs_tot_size =
% 
%    4.0000e+03
% 
% 
% V_min =
% 
%     0.9714
% 
% 
% V_max =
% 
%      1
% 
% 
% Total_PLoss =
% 
%   411.4659
% 
% 
% Total_QLoss =
% 
%   192.2893
% 
% 
% over_all_power_factor =
% 
%     0.8711
% 
% 
% min_conv =
% 
%   411.4659
% 
% 
case_5_conv =[

  425.4538
  425.4538
  425.4538
  425.4538
  425.4538
  425.4538
  425.4538
  425.4538
  425.4538
  425.4538
  425.4538
  425.4538
  425.4538
  425.4538
  425.4538
  424.0250
  421.3366
  421.3366
  421.1772
  419.7467
  417.2823
  417.2823
  416.8619
  416.7144
  416.5316
  415.2274
  414.5015
  414.4143
  413.7539
  413.7539
  413.4208
  413.4208
  413.3753
  413.2656
  412.7121
  411.7403
  411.7403
  411.6818
  411.6818
  411.6818
  411.5651
  411.5200
  411.5200
  411.5200
  411.5200
  411.4979
  411.4805
  411.4700
  411.4659
  411.4659];
% 
% 
case_5_v =[

    1.0000
    0.9884
    0.9838
    0.9828
    0.9804
    0.9786
    0.9772
    0.9768
    0.9755
    0.9751
    0.9750
    0.9748
    0.9748
    0.9825
    0.9771
    0.9755
    0.9750
    0.9724
    0.9722
    0.9720
    0.9721
    0.9716
    0.9716
    0.9714
    0.9720
    0.9722
    0.9720
    0.9720
    0.9717
    0.9717];
% 
% 
% minee =
% 
%     0.9714
% 
% 
% minbus =
% 
%     24
% 



%==========================================================================
%==========================================================================
%==========================================================================
%==========================================================================


case_0=EDN.voltages








x=1:EDN.Nb;
w=1:50;
for i=1:EDN.Nb;
    y(i)=.95;
end


for i=1:EDN.Nb;
    y(i)=.95;
end
figure(1)
plot(x,case_0,'-or',x,case_1_v,'-b^',x,case_2_v,'-m^',x,case_3_v,'-^g',x,case_4_v,'-^',x,case_5_v,'-^',x,y,'k--')
legend('case 0','case 1','case 2','case 3','case 4','case 5','minimum voltage')
title('EDN')
xlabel('Bus')
ylabel('voltage P.U.')
temp1=['voltage profile','.png'];
saveas(gca,temp1);
figure(2)
plot(w,case_2_conv,'-m^',w,case_1_conv,'-^g',w,case_4_conv,'-^',w,case_5_conv,'-^')
legend('case 2','case 1','case 4','case 5')
title('convergence curve')
xlabel('Bus')
ylabel('Total Power loss')
temp1=['convergence curve 4 cases','.png'];
saveas(gca,temp1);
figure(3)
plot(w,case_3_conv,'-b^')
legend('case 3')
title('convergence curve')
xlabel('Bus')
ylabel('Total Power loss')
temp1=['convergence curve cap','.png'];
saveas(gca,temp1);