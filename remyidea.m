%% Remy idea
prefix='E';
jj=10;
mat=strcat('/Users/Poincare/Dropbox/Documentos/CFATA/8CLR/ServicioSocial/Thesis/MainWavelet/',prefix);
cd (mat)
name=strcat(mat,'/r',prefix,int2str(jj),'.csv');
mena=csvread(name)

plot(mena)
hold on
plot(diff(mena))
plot(10*sign(diff(mena))+25)
plot(find((diff(sign(diff(mena)))~=0)==1)+1,mena(find((diff(sign(diff(mena)))~=0)==1)+1),'.r')
%plot(conv(mena,diff(mena))/max(conv(mena,diff(mena))))
hold off
