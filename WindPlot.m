function [] = WindPlot(WD,WS31,WS30,WS28,chord,twist,r,Power)
%Creates wind rose plot for wind direction data
figure
polarhistogram(WD,'FaceColor','red','FaceAlpha',.5)
grid on
title('Wind Rose Plot of Calgary Wind Throughout 2017')
thetaticklabels({'North, 0°','30°','60°','East, 90°','120°','150°','South, 180°',...
'210°','240°','West, 270°','300°','330°'}) %sets labels for 30° increments for wind direction
legend('Freq.of Wind Occurance (In # of Hours)','location','southoutside');

%%
%relative distribution of wind speed// energy output
Power=[0 Power]; %just adds the power output for the 0 windspeed case
for i=1:7 %7 months with 31 days
    lowlim=min(WS31(i,:)); %finds lower limit of windspeed for the months with 31 days
    uplim=max(WS31(i,:)); %finds the upper limit of windspeed for the months with 31 days
    x=lowlim:uplim; %sets x as a vector from the lowest wind speed of the month to the fastest windspeed of the month incremented by 1
    hours=zeros(1,length(x)); %sets hours as a vector the same length of x
    Energy=zeros(1,length(x)); %sets energy as a vector the same length of  x
    month=['Jan';'Mar';'May';'Jul';'Aug';'Oct';'Dec']; % array of strings just for titles of figures
    for j=1:length(hours)
       hours(j)=sum(WS31(i,:)==x(j)); %sets each value of hours to the number of hours in that month that the wind speed was observed
       Energy(j)=Power(j)*hours(j); %sets each value of Energy to the Power at that windspeed*#hours at that windspeed (E=P*t)
    end
    %plotting the results
            figure
            yyaxis left %sets left y axis as preference for upcoming plot
            bar(x,hours) %creates a bar graph for windspeed distribution
            ylabel('Occurance')
            yyaxis right %sets right y axis as preference for upcoming plot
          line(x,Energy) %creates a line graph for energy output per windspeed
            xlabel('Windspeed @85 m Hub Height (m/s)')
            ylabel('Energy Output (Wh) ');
            title([month(i,:),' Windspeed and Energy Distribution']);
            grid on
      
end

for i=1:4 % four months at 30 days
    lowlim=min(WS30(i,:));%finds the lower limit of windspeed for the months with 30 days
    uplim=max(WS30(i,:)); %finds the upper limit of windspeed for the months with 30 days
    x=lowlim:uplim; %sets x as a vector from the lowest wind speed of the month to the fastest windspeed of the month incremented by 1
    hours=zeros(1,length(x)); %sets hours as a vector the same length of x
    Energy=zeros(1,length(x)); %sets energy as a vector the same length of  x
    month=['Apr';'Jun';'Sep';'Nov']; % array of strings just for titles of figures
    for j=1:length(hours)
        hours(j)=sum(WS30(i,:)==x(j)); %sets each value of hours to the number of hours in that month that the wind speed was observed
        Energy(j)=Power(j)*hours(j); %sets each value of Energy to the Power at that windspeed*#hours at that windspeed (E=P*t)
    end
         figure
            yyaxis left %sets left y axis as preference for upcoming plot
            bar(x,hours) %creates a bar graph for windspeed distribution
            ylabel('Occurance')
            yyaxis right %sets right y axis as preference for upcoming plot
          line(x,Energy) %creates a line graph for energy output per windspeed
            xlabel('Windspeed @85 m Hub Height (m/s)')
            ylabel('Energy Output (Wh) ');
            title([month(i,:),' Windspeed and Energy Distribution']);
            grid on
end
    %lastly the case for feb.
    lowlim=min(WS28(:)); %finds the lower limit of windspeed for the month with 28 days
    uplim=max(WS28(:)); %finds the upper limit of windspeed for the month with 28 days
    x=lowlim:uplim; %sets x as a vector from the lowest wind speed of the month to the fastest windspeed of the month incremented by 1
    hours=zeros(1,length(x)); %sets hours as a vector the same length of x
     Energy=zeros(1,length(x)); %sets energy as a vector the same length of  x
    
    for j=1:length(hours) 
        hours(j)=sum(WS28(:)==x(j));%sets each value of hours to the number of hours in that month that the wind speed was observed
        Energy(j)=Power(j)*hours(j); %sets each value of Energy to the Power at that windspeed*#hours at that windspeed (E=P*t)
    end
          figure
            yyaxis left %sets left y axis as preference for upcoming plot
            bar(x,hours) %creates a bar graph for windspeed distribution
            ylabel('Occurance')
            yyaxis right %sets right y axis as preference for upcoming plot
          line(x,Energy) %creates a line graph for energy output per windspeed
            xlabel('Windspeed @85 m Hub Height (m/s)')
            ylabel('Energy Output (Wh) ');
            title([month(i,:),' Windspeed and Energy Distribution']);
            grid on
%%
%blade geometry 
figure
for i=1:length(r) % creates a plot at each radial position
%the following two lines of code multiply the X and Y vectors by the chord length at the given radial position because the data given to plot
% the airfoil geometry was in x/c and y/c 
X=chord(i)*[1	0.9966	0.99314	0.98961	0.98601	0.98235	0.97863	0.97484	0.97098	0.96706	0.96307	0.95902	0.9549	0.95072	0.94647	0.94216	0.93778	0.93333	0.92882	0.92425	0.91961	0.9149	0.91013	0.90529	0.90039	0.89542	0.89039	0.88529	0.88013	0.8749	0.86961	0.86425	0.85882	0.85333	0.84778	0.84216	0.83647	0.83072	0.8249	0.81902	0.81307	0.80706	0.80098	0.79484	0.78863	0.78235	0.77601	0.76961	0.76314	0.7566	0.75	0.74333	0.73667	0.73	0.72333	0.71667	0.71	0.70333	0.69667	0.69	0.68333	0.67667	0.67	0.66333	0.65667	0.65	0.64333	0.63667	0.63	0.62333	0.61667	0.61	0.60333	0.59667	0.59	0.58333	0.57667	0.57	0.56333	0.55667	0.55	0.54333	0.53667	0.529999	0.52333	0.51667	0.51	0.50333	0.49667	0.49	0.48333	0.47667	0.47	0.46333	0.45667	0.45	0.44333	0.43667	0.43	0.42333	0.41667	0.41	0.40333	0.39667	0.389999	0.38333	0.37667	0.37	0.36333	0.35667	0.35	0.34333	0.33667	0.33	0.32333	0.31667	0.31	0.30333	0.29667	0.29	0.283329	0.27667	0.27	0.26333	0.25667	0.25	0.24342	0.23693	0.23053	0.22421	0.21798	0.21184	0.20579	0.19982	0.19395	0.18816	0.18245	0.17684	0.17131	0.16587	0.16052	0.15526	0.15008	0.14499	0.13999	0.13508	0.13026	0.12552	0.12087	0.11631	0.11183	0.10745	0.10315	0.09893	0.09481	0.09077	0.08683	0.08297	0.07919	0.07551	0.07191	0.0684	0.06498	0.06164	0.0584	0.05524	0.05217	0.04918	0.04629	0.04348	0.04076	0.03812	0.03558	0.03312	0.03075	0.02847	0.02627	0.02417	0.02215	0.02022	0.01837	0.01662	0.01495	0.01337	0.01187	0.01047	0.00915	0.00792	0.00678	0.00572	0.00476	0.00388	0.00309	0.00238	0.00177	0.00124	0.0008	0.00044	0.00018	0	0.00018	0.00044	0.0008	0.00124	0.00177	0.00238	0.00309	0.00388	0.00476	0.00572	0.00678	0.00792	0.00915	0.01047	0.01187	0.01337	0.01495	0.01662	0.01837	0.02022	0.02215	0.02417	0.02627	0.02847	0.03075	0.03312	0.03558	0.03812	0.04076	0.04348	0.04629	0.04918	0.05217	0.05524	0.0584	0.06164	0.06498	0.0684	0.07191	0.07551	0.07919	0.08297	0.08683	0.09077	0.09481	0.09893	0.10315	0.10745	0.11183	0.11631	0.12087	0.12552	0.13026	0.13508	0.13999	0.14499	0.15008	0.15526	0.16052	0.16587	0.17131	0.17684	0.18245	0.18816	0.19395	0.19982	0.20579	0.21184	0.217981	0.22421	0.23053	0.23693	0.24342	0.25	0.25667	0.26333	0.27	0.27667	0.28333	0.29	0.29667	0.30333	0.31	0.31667	0.32333	0.33	0.33667	0.34333	0.35	0.35667	0.36333	0.37	0.37667	0.38333	0.39	0.39667	0.40333	0.41	0.41667	0.42333	0.43	0.43667	0.44333	0.45	0.45667	0.46333	0.47	0.47667	0.483331	0.49	0.49667	0.50333	0.51	0.51667	0.52333	0.53	0.53667	0.54333	0.55	0.55667	0.56333	0.57	0.57667	0.58333	0.59	0.59667	0.60333	0.61	0.61667	0.62333	0.63	0.63667	0.64333	0.65	0.65667	0.66333	0.67	0.67667	0.68333	0.69	0.69667	0.70333	0.71	0.71667	0.72333	0.73	0.73667	0.74333	0.75	0.7566	0.76314	0.76961	0.77601	0.78235	0.78863	0.79484	0.80098	0.80706	0.81307	0.81902	0.8249	0.83072	0.83647	0.84216	0.84778	0.85333	0.85882	0.86425	0.86961	0.8749	0.88013	0.88529	0.89039	0.89542	0.90039	0.90529	0.91013	0.9149	0.91961	0.92425	0.92882	0.93333	0.93778	0.94216	0.94647	0.95072	0.9549	0.95902	0.96307	0.96706	0.97098	0.97484	0.97863	0.98235	0.98601	0.98961	0.99314	0.9966	1];
Y=chord(i)*[0.00347	0.00455	0.00565	0.00678	0.00795	0.00914	0.01035	0.01158	0.01283	0.01410	0.01539	0.01670	0.01803	0.01937	0.02074	0.02212	0.02352	0.02495	0.02639	0.02786	0.02936	0.03087	0.03242	0.03400	0.03560	0.03723	0.03887	0.04056	0.04226	0.04399	0.04575	0.04754	0.04935	0.05119	0.05305	0.05493	0.05685	0.05878	0.06076	0.06275	0.06476	0.06680	0.06886	0.07094	0.07304	0.07517	0.07730	0.07947	0.08165	0.08386	0.08608	0.08832	0.09056	0.09279	0.09502	0.09724	0.09946	0.10166	0.10386	0.10605	0.10822	0.11040	0.11256	0.11471	0.11685	0.11897	0.12109	0.12318	0.12527	0.12733	0.12938	0.13142	0.13343	0.13543	0.13742	0.13938	0.14131	0.14323	0.14512	0.14698	0.14882	0.15064	0.15242	0.15417	0.15591	0.15759	0.15925	0.16088	0.16246	0.16401	0.16553	0.16701	0.16844	0.16985	0.17120	0.17253	0.17381	0.17504	0.17624	0.17739	0.17849	0.17957	0.18058	0.18154	0.18246	0.18333	0.18415	0.18491	0.18563	0.18629	0.18690	0.18746	0.18797	0.18842	0.18881	0.18914	0.18940	0.18961	0.18973	0.18979	0.18977	0.18968	0.18950	0.18924	0.18890	0.18845	0.18791	0.18729	0.18657	0.18575	0.18487	0.18388	0.18282	0.18167	0.18046	0.17916	0.17778	0.17634	0.17482	0.17323	0.17158	0.16987	0.16809	0.16625	0.16436	0.16240	0.16038	0.15831	0.15619	0.15402	0.15179	0.14953	0.14722	0.14485	0.14243	0.13998	0.13748	0.13493	0.13234	0.12972	0.12705	0.12435	0.12161	0.11884	0.11603	0.11319	0.11031	0.10740	0.10447	0.10150	0.09851	0.09549	0.09246	0.08940	0.08632	0.08324	0.08013	0.07701	0.07387	0.07070	0.06751	0.06433	0.06111	0.05790	0.05468	0.05148	0.04826	0.04505	0.04181	0.03847	0.03502	0.03133	0.02736	0.02318	0.01920	0.01552	0.01217	0.00892	0.00563	0.00000	-0.00567	-0.00905	-0.01247	-0.01591	-0.01956	-0.02333	-0.02716	-0.03085	-0.03442	-0.03783	-0.04120	-0.04453	-0.04785	-0.05117	-0.05447	-0.05781	-0.06113	-0.06446	-0.06775	-0.07107	-0.07437	-0.07766	-0.08092	-0.08421	-0.08748	-0.09076	-0.09406	-0.09733	-0.10064	-0.10392	-0.10720	-0.11047	-0.11374	-0.11698	-0.12023	-0.12344	-0.12665	-0.12982	-0.13299	-0.13612	-0.13922	-0.14230	-0.14535	-0.14835	-0.15135	-0.15429	-0.15720	-0.16006	-0.16289	-0.16567	-0.16842	-0.17111	-0.17376	-0.17635	-0.17890	-0.18137	-0.18380	-0.18616	-0.18847	-0.19070	-0.19287	-0.19496	-0.19698	-0.19894	-0.20080	-0.20257	-0.20425	-0.20584	-0.20733	-0.20870	-0.20996	-0.21110	-0.21210	-0.21297	-0.21370	-0.21429	-0.21472	-0.21501	-0.21515	-0.21516	-0.21502	-0.21476	-0.21437	-0.21384	-0.21320	-0.21243	-0.21155	-0.21057	-0.20948	-0.20827	-0.20697	-0.20556	-0.20407	-0.20248	-0.20081	-0.19904	-0.19720	-0.19527	-0.19327	-0.19119	-0.18905	-0.18683	-0.18454	-0.18219	-0.17976	-0.17727	-0.17473	-0.17212	-0.16945	-0.16673	-0.16397	-0.16115	-0.15828	-0.15537	-0.15242	-0.14942	-0.14639	-0.14333	-0.14024	-0.13713	-0.13399	-0.13083	-0.12765	-0.12446	-0.12125	-0.11804	-0.11482	-0.11160	-0.10838	-0.10515	-0.10192	-0.09870	-0.09549	-0.09228	-0.08909	-0.08590	-0.08274	-0.07958	-0.07645	-0.07333	-0.07024	-0.06717	-0.06413	-0.06112	-0.05814	-0.05519	-0.05228	-0.04941	-0.04658	-0.04382	-0.04114	-0.03853	-0.03600	-0.03354	-0.03116	-0.02887	-0.02665	-0.02452	-0.02247	-0.02050	-0.01862	-0.01681	-0.01510	-0.01346	-0.01191	-0.01045	-0.00907	-0.00776	-0.00653	-0.00539	-0.00434	-0.00335	-0.00245	-0.00160	-0.00085	-0.00015	0.00046	0.00103	0.00151	0.00193	0.00229	0.00258	0.00279	0.00295	0.00303	0.00303	0.00296	0.00282	0.00261	0.00232	0.00194	0.00149	0.00098	0.00040	-0.00025	-0.00097	-0.00176	-0.00261	-0.00347];
axis([-1 5 -2 2.5])
poly=polyshape(X,Y); %creates a polygon in the shape outlined by the airfoil
airfoil=rotate(poly,twist(i),[1/2 0]); %rotates the polygon based on the twist at each radial position
plot(airfoil)
hold on 
end
end









