% Template_zeropadding=zeros(10000,1);
% Template_zeropadding(3735:(3735+2530),1)=template-1000;
% plot(DATA_Fitted(:,1),Template_zeropadding)

Start_Temp=600;%dove comincio in DATA_Fitted(:,2)
End_Temp=3300;%dove finisco in DATA_Fitted(:,2)
Length_Temp=End_Temp-Start_Temp

start_padding=ceil(5000-Length_Temp/2);%metto nel mezzo i punti cel template
end_padding=ceil(start_padding+Length_Temp);

Template_zeropadding=zeros(10000,1);
Template_zeropadding(start_padding:end_padding,1)=DATA_Fitted(Start_Temp:End_Temp,2)-1000;
plot(DATA_Fitted(:,1),Template_zeropadding)