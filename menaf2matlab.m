%% init
tic
clc
clear all
hold off
v=131000;
pre=['E0';'EA';'EC';'ED';'EE';'EF';'EG';'EH';'EI';'EJ';'EK';'EL';'EM';'EN';'EO';'EP';'EQ';'ER'];
for im=1:length(pre)
    prefix=pre(im,:);
        switch prefix
        case 'E0'
            prefix='E';        
    end
    mat=strcat('/Users/Poincare/Desktop/MainWavelet/');
    cd (mat)
    jj=10; maxi=59;
    ext='.tif';
    
%     menamaxminl=zeros(maxi-9,4);
%     menamaxminh=zeros(maxi-9,4);
%     menamaxmin=csvread(strcat('menamaxmin',prefix,'.csv'));
%     menamax=csvread(strcat('menamax',prefix,'.csv'));
%     menamin=csvread(strcat('menamin',prefix,'.csv'));
%     menamaxcluster=csvread(strcat('menamaxcluster',prefix,'.csv'));
%     menamaxcluster=menamaxcluster';
%     menamincluster=csvread(strcat('menamincluster',prefix,'.csv'));
%     menamincluster=menamincluster';
    
    % Plot data
    hold off
    jjp=0;
    switch prefix
        case 'E'
            maxi=99;jjp=[30];
    end
    while jj<=maxi
        if jj~=jjp
            name=strcat(mat,'/obs',prefix,int2str(jj),'.csv');
            mena=csvread(name);
            dim=length(mena);
            %time=[0:(1/v):(dim-1)*(1/v)];
            
            %pause
            plot(0,0)
            %mena=mena-mena(1);
            
            %name=strcat(mat,'/menadct',prefix,int2str(jj),'.csv');
            %menadct=csvread(name);
            
            %menap=mena-menadct;
            
            plot(mena,'b')
            hold on
            if 0
                for kk=1:length(menamax(jj-9,:))
                    if menamax(jj-9,kk)~=0
                        plot(menamax(jj-9,kk),mena(menamax(jj-9,kk)),'.g')
                    end
                end
                for kk=1:length(menamin(jj-9,:))
                    if menamin(jj-9,kk)~=0
                        plot(menamin(jj-9,kk),mena(menamin(jj-9,kk)),'.r')
                    end
                end
            end
            %             if mena~=0
            %                 topbot=24;
            %                 [hmax,lmax]=findpeaks(menap(topbot:length(menap)),'minpeakdistance',30,'NPEAKS',2,'MINPEAKHEIGHT',0,'THRESHOLD',0); %% plox peaks
            %                 lmax=lmax+topbot-1;
            %                 plot(time(lmax),mena(lmax)/mena(1),'.g')
            %                 [hmin,lmin]=findpeaks(-menap(1:length(menap)),'minpeakdistance',30,'NPEAKS',2,'MINPEAKHEIGHT',0,'THRESHOLD',0); %% plox peaks
            %                 lmin=lmin+1-1;
            %                 hmin=-hmin;
            %                 plot(time(lmin),mena(lmin)/mena(1),'.g')
            %                 menamaxminl(jj-9,:)=[time(lmin) time(lmax)];
            %                 menamaxminh(jj-9,:)=[(mena(lmin)/mena(1))' (mena(lmax)/mena(1))'];
            %             end
        end
        
        
        clc
        jj
        % Export to Mathematica
        %xlswrite(strcat('mena',int2str(jj)),mena)
        jj=jj+1;
        
        %hold off
        %pause
        
    end
    hold on
    if 0
        ct=floor(median(menamaxmin));
        dct=floor(iqr(menamaxmin));
        emm=floor(ct-dct/2);
        epp=floor(ct+dct/2);
        plot(ct,20,'.r')
        for ii=1:length(menamaxmin(1,:))
            plot([emm(ii),epp(ii)],[20,20],'r')
            
        end
    end
    % plot min clusters
    if 0
        ctmin=floor(median(menamincluster));
        dctmin=floor(iqr(menamincluster));
        emmmin=floor(ctmin-dctmin/2);
        eppmin=floor(ctmin+dctmin/2);
        plot(ctmin,10,'.r')
        for ii=1:length(menamincluster(1,:))
            plot([eppmin(ii),emmmin(ii)],[10,10],'r')
        end
    end
    % plot max clusters
    if 0
        ctmax=floor(median(menamaxcluster));
        dctmax=floor(iqr(menamaxcluster));
        emmmax=floor(ctmax-dctmax/2);
        eppmax=floor(ctmax+dctmax/2);
        plot(ctmax,10,'.g')
        for ii=1:length(menamaxcluster(1,:))
            plot([eppmax(ii),emmmax(ii)],[10,10],'g')
        end
        
    end
    %     for ii=1:4
    %
    % %         if menamaxminl(:,ii)~=0
    % %             plot(menamaxminl(:,ii),menamaxminh(:,ii),'g')
    % %         end
    %         mml=median(menamaxminl(:,ii));
    %         eel=iqr(menamaxminl(:,ii));
    %
    %         mmh=median(menamaxminh(:,ii));
    % %         eeh=iqr(menamaxminh(:,ii));
    %         plot(mml,.5,'.r')
    % %         plot([mml,mml],[mmh-eeh,mmh+eeh],'r')
    %         plot([mml-eel,mml+eel],[.5,.5],'r')
    %
    %     end
    
    
    prefix
    grid on
    pause %prefix halt
end
hold off
cd /Users/Poincare/Dropbox/Documentos/CFATA/8CLR/ServicioSocial/
toc

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


