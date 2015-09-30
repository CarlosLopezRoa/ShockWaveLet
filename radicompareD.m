%% init
tic
clc
clear all
v=94000;
mat='/Users/Poincare/Desktop/Datos2/';
prefix='D';
for im=1:1
    dd=100;     %270,380,590
    uu=900;  %70,90,125 %%220
    jj=1;
    maxi=10;
    ext='.tif';
    
    mena=zeros(uu-dd,1);
    mena1=zeros(uu-dd,1);
    mena2=zeros(uu-dd,1);
    mena3=zeros(uu-dd,1);    
    time=[0:(1/v):(uu-dd-1)*(1/v)];
    hold off
    %% Plot data
    jjp=0;
        if jj~=jjp
            dire=strcat(mat,prefix,'00',int2str(jj),'/');
            j=dd;
            mena=zeros(uu-dd,1);
            while j<uu
                
                name=strcat(dire,prefix,'000',int2str(j),ext);
                cdata=imread(name);
                dim=length(cdata);
                cdata=255-cdata;    %Inversión
                cdata=cast(cdata,'double');
                j=j+1;
                mena(j-dd)=sqrt(mean(mean(cdata))); %mean,median,sum
                mena1(j-dd)=sqrt(mean(mean(cdata)));
                mena2(j-dd)=sqrt(median(median(cdata)));
                mena3(j-dd)=sqrt(sum(sum(cdata>0)));
            end
%             mena=mena/mena(1);
%             mena1=mena1/mena1(1);
%             mena2=mena2/mena2(1);
%             mena3=mena3/mena3(1);%normalizar
            %plot(mena)
             plot(time,mena1,'r')
             hold on
%             plot(time,mena2,'g')
%             plot(time,mena3,'b')
%             legend('media','mediana','suma')

            
            inc=0:2*16:255;
            for i=1:length(inc)
                incc=inc(i);
                j=dd;
                while j<uu
                    
                    name=strcat(dire,prefix,'000',int2str(j),ext);
                    cdata=imread(name);
                    dim=length(cdata);
                    
                    cdata=255-cdata;    %Inversión
                    cdata=cast(cdata,'double');
                    %image(cdata)
                    %pause
                    j=j+1;
                    mena(j-dd)=sqrt(mean(mean(cdata))); %mean,median,sum
                    mena1(j-dd)=sqrt(mean(mean(cdata)));
                    mena2(j-dd)=sqrt(median(median(cdata)));
                    mena3(j-dd)=sqrt(sum(sum(cdata>incc)));   
                end
                plot(time,mena3)
                grid on
                %pause
                incc
            end
             legend('media','suma_T')
            
        end
        clc
        jj
     
        
        hold off
        %pause
    end
    prefix
    grid on
    %pause

hold off
cd /Users/Poincare/Dropbox/Documentos/CFATA/8CLR/ServicioSocial/
toc