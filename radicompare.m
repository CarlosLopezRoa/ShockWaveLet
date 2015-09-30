%% init
tic
clc
clear all
v=94000;
%axe=linspace(0,(uu-dd)*(1/94),uu-dd);
pre=['E0';'EA';'EC';'ED';'EE';'EF';'EG';'EH';'EI';'EJ';'EK';'EL';'EM';'EN';'EO';'EP';'EQ';'ER'];

for im=1:1
    mat='/Users/Poincare/Desktop/Datos4/';
    prefix=pre(im,:);
    switch prefix
        case 'E0'
            prefix='E';
    end
    cd (strcat('/Users/Poincare/Desktop/fil4/',prefix))
    dd=373;     %270,380,590
    uu=dd+100;  %70,90,125 %%220
    jj=10;
    maxi=10;
    ext='.tif';
    
    mena=zeros(uu-dd,1);
    mena1=zeros(uu-dd,1);
    mena2=zeros(uu-dd,1);
    mena3=zeros(uu-dd,1);
    
    
    % mena1=zeros(uu-dd,1);
    % mena2=zeros(uu-dd,1);
    % mena3=zeros(uu-dd,1);
    
    
    menaout = zeros(1,maxi-jj);
    menaiout = zeros (1,maxi-jj);
    menadtout = zeros (1,maxi-jj);
    time=[0:(1/v):(uu-dd-1)*(1/v)];
    hold off
    %% Plot data
    jjp=0;
    switch prefix
        case 'E'
            jjp=[82,19,46,54,91,43,50,62,18,30];                %%E
            mat='/Users/Poincare/Desktop/Datos2/';
            dd=392;
            uu=dd+100;
            maxi=10;
        case 'EA'
            jjp=[20,39,41,42,43];                            %%EA
        case 'EC'
            jjp=[10,11,12,13,14,15,16];                      %%EC
        case 'ED'
            jjp=[10,11];                                     %%ED
    end
    while jj<=maxi
        %if   jj~=30 && jj~=43 && jj~=50 && jj~=62 && jj~=64 && jj~=68 &&
        %if    jj~=19 && jj~=23 && jj~=27 && jj~=13                             %%DA
        %if  jj~=12 && jj~=16 && jj~=21 && jj~=22 && jj~=23                     %%DB
        if jj~=jjp
            dire=strcat(mat,prefix,'0',int2str(jj),'/');
            j=dd;
            mena=zeros(uu-dd,1);
            while j<uu
                
                name=strcat(dire,prefix,'000',int2str(j),ext);
                cdata=imread(name);
                dim=length(cdata);
                
                cdata=255-cdata;    %Inversión
                
                %image(cdata)
                %pause
                j=j+1;
                mena(j-dd)=mean(mean(cdata)); %mean,median,sum
                mena1(j-dd)=mean(mean(cdata));
                mena2(j-dd)=median(median(cdata));
                mena3(j-dd)=sum(sum(cdata>0));
                
                
                
            end
            % mena=mena/mena(1); %normalizar
            %plot(mena)
            plot(time,mena1,'r')
            hold on
            %plot(time,mena2,'g')
            inc=0:2*16:255;
            for i=1:length(inc)
                incc=inc(i);
                j=dd;
                while j<uu
                    
                    name=strcat(dire,prefix,'000',int2str(j),ext);
                    cdata=imread(name);
                    dim=length(cdata);
                    
                    cdata=255-cdata;    %Inversión
                    
                    %image(cdata)
                    %pause
                    j=j+1;
                    mena(j-dd)=mean(mean(cdata)); %mean,median,sum
                    mena1(j-dd)=mean(mean(cdata));
                    mena2(j-dd)=median(median(cdata));
                    mena3(j-dd)=sum(sum(cdata>incc));   
                       
                end
                
                plot(time,mena3)
                pause
                incc
            end
            %legend('media','mediana','suma')
            %     if mena(1)~=0                                 %%Plot max-min
            %         bot=1:find(mena==max(mena));
            %         menat=mena(bot);
            %         menaoutbot=min(find(menat==min(menat)));
            %         menaouttop=max(find(mena==max(mena)));
            %         menaout(jj-9) =  menaouttop-menaoutbot;
            %             plot(time(menaoutbot),mena(menaoutbot),'.r')
            %             plot(time(menaouttop),mena(menaouttop),'r.')
            %         menaiout(jj-9) = mena(1);
            %         menaiouti=min(find(mena==mena(1)));
            %             plot(time(menaiouti),mena(menaiouti),'g.')
            %         menadtoutbot=menaoutbot;
            %         menadtouttop=max(find(mena(menaouttop:end)==min(mena(menaouttop:end)))+menaouttop-1);
            %         menadtout(jj-9) =menadtouttop -menadtoutbot;
            %             plot(time(menadtoutbot),mena(menadtoutbot),'go')
            %             plot(time(menadtouttop),mena(menadtouttop),'g.')
            %     end
            
        end
        clc
        jj
        % Export to Mathematica
        xlswrite(strcat('mena',prefix,int2str(jj)),mena)
        jj=jj+1;
        
        %hold off
        %pause
    end
    prefix
    grid on
    %pause
end

hold off
cd /Users/Poincare/Dropbox/Documentos/CFATA/8CLR/ServicioSocial/


%% Export to R
% xlswrite('menaout',menaout')
% xlswrite('menaiout',menaiout')
% xlswrite('menadtout',menadtout')
%% Plot Osciloscopio
% jj=22;
% hold on
% dire1=strcat('/Users/Poincare/Desktop/Datos3/ALL00',int2str(jj),'/');
% prefix1=strcat('F00',int2str(jj),'CH');
% ext1='.CSV';
% j1=1;
% name1=strcat(dire1,prefix1,int2str(j1),ext1);
% ch1=csvread(name1,:,3);
% j1=j1+1;
% name1=strcat(dire1,prefix1,int2str(j1),ext1);
% ch2=csvread(name1,:,3);
% plot(ch1(and(ch1(:,1)>=0 , ch1(:,1)<time(uu-dd)),1),(ch1(and(ch1(:,1)>=0,ch1(:,1)<time(uu-dd)),2)+5.3)/(2*max(ch1(:,2)+5.3)))
% plot(ch2(and(ch2(:,1)>=0 , ch2(:,1)<time(uu-dd)),1),(ch2(and(ch2(:,1)>=0 , ch2(:,1)<time(uu-dd)),2))/(2*max(ch2(:,2))),'r')
% hold off

%% Idea de normalización 1


toc