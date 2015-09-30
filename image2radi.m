%image2radi.m                            Carlos Lopez Roa CFATA-UNAM 2013
% Este codigo toma carpetas de fotografias en formato .tif y las convierte
% en arreglos de valores numericos en .csv
%% init
tic   %Inicia un contador de tiempo
clc   %Limpiar prompt
clear all %Limpiar Workspace
cd /Users/Poincare/Dropbox/Documentos/CFaTa/8CLR/ServicioSocial/
%Cambiar de directorio activo
v=131000;                                   %Velocidad de las grabaciones
pre=['B0';'F0';'D0';'E0';'EA';'EC';'ED';'EE';'EF';'EG';'EH';'EI';'EJ';'EK';
    'EL';'EM';'EN';'EO';'EP';'EQ';'ER'];    %Subcarpetas a explorar
for im=1:length(pre) %Ciclo general sobre las subcarpetas
    mat='/Users/Poincare/Desktop/Datos4/'; %El directorio donde se alojan
    %las subcarpetas
    prefix=pre(im,:);                      %Cambiador de subcarpetas
    switch prefix
        case 'B0'
            prefix='B';
        case 'E0'
            prefix='E';
        case 'D0'
            prefix='D';
        case 'F0'
            prefix='F';
    end
    cd (strcat('/Users/Poincare/Dropbox/MainWavelet/',prefix))
    %Cambia de directorio a donde se quiere escribir los archivos CSV%
    dd=360;     %270,380,590 %368          %Fotograma de inicio de interes
    uu=dd+300;  %70,90,125 %%220           %Fotograma de fin de interess
    jj=10;                                 %Iterador de los ensayos
    maxi=59;                               %Numero total de ensayos
    ext='.tif';                            %Extension de las fotografias
    time=[0:(1/v):(uu-dd-1)*(1/v)];        %Arreglo con los instantes
    %correspondientes de tiempo real a cada fotograma
    hold off                               %Manejo de figuras
    %% Plot data
    switch prefix
        case 'B'
            mat='/Users/Poincare/Desktop/Datos2/';
            dd=266+5;
            uu=dd+215;
            maxi=15;
            jj=1;
            prefix1='ImgB';
        case 'E'
            mat='/Users/Poincare/Desktop/Datos2/';
            dd=380;
            uu=dd+300;
            maxi=99;
        case 'D'
            mat='/Users/Poincare/Desktop/Datos2/';
            dd=266+5;
            uu=dd+215;
            maxi=99;
        case 'F'
            mat='/Users/Poincare/Desktop/Datos2/';
            dd=605-22;
            uu=dd+415;
            maxi=99;
            
    end
    
    while jj<=maxi                         %Segundo ciclo sobre los ensayos
        dire=strcat(mat,prefix,'0',int2str(jj),'/');%Directorio del ensayo
        if jj<10
            dire=strcat(mat,prefix,'00',int2str(jj),'/');
        end
        j=dd;                                  %Iterador de los fotogramas
        r=zeros(uu-dd,1);
        while j<uu                       %Tercer ciclo sobre los fotogramas
            name=strcat(dire,prefix,'000',int2str(j),ext);
            if prefix=='B'
                name=strcat(dire,prefix1,'000',int2str(j),ext);
            end
            
            %Nombre del fotograma
            cdata=imread(name);        %Variable de los fotogramas
            dim=length(cdata);         %Dimension del arreglo del fotograma
            cdata=255-cdata;           %Inversion
            cdata=cast(cdata,'double');%Hace cdata un arreglo tipo doble
            j=j+1;                     %Aumento de interador del fotograma
            r(j-dd)=sqrt(mean(mean(cdata))); %Aplicacion de la funcion f
        end
        %r=r/r(1);                      %Se adimensionaliza r
        plot(r)                        %Grafica r
        grid on                        %Activa la malla
        hold on                        %Manejo de figuras
        clc
        prefix
        jj
        
        %pause                         %Pausa optativa
        % Export to Mathematica
        xlswrite(strcat('r',prefix,int2str(jj)),r) %Exporta r en CSV
        jj=jj+1;                       %Aumento de interador de ensayos
    end
    hold off
    %pause
end
hold off                               %Manejo de figuras
cd /Users/Poincare/Dropbox/Documentos/CFATA/8CLR/ServicioSocial/
toc                              %Muestra el tiempo empleado en el computo