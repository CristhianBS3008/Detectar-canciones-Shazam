clear all, close all, clc
%% Matriz de las canciones
%Solo 5 bloques por cancion [a=K11 b=K22 c=K33 d=K44 e=K55 f=K66]

%    31.25Hz   62.5Hz     125Hz     250Hz     500Hz     1K Hz     2K Hz     4K Hz      8K Hz     16K Hz
% a1 = [2.0669   69.2132   52.7663  100.0000   55.3098   61.0096   13.2671   18.2696   29.7071    6.1161];
% a2 = [2.2520  100.0000   66.0060   42.8851   23.2047   72.7975   21.3170    7.5646    2.1460    0.8725];
% a3 = [1.5723  100.0000   72.1899   75.0582   49.4152   68.1727   18.3331   14.9703    6.6501    2.3861];
% a4 = [2.6373  100.0000   54.8519   83.7295   28.9791   32.6866   15.2003    9.9620    5.7617    1.6364];
% a5 = [2.8563   86.2572   53.3849  100.0000   53.2789   34.7970   12.9282   26.5116    5.6228    1.0511];
% 
% b1 = [2.4168   53.4851   91.6607  100.0000   21.4611    8.7889    4.2116    1.6806    2.0630    0.8412];
% b2 = [2.5916   13.4913   54.9441  100.0000   28.5579    9.9157    4.2234    3.1577    3.4921    0.5864];
% b3 = [1.6714   55.1774  100.0000   49.6180   13.7572    3.1690    1.3661    0.7579    0.7671    0.8058];
% b4 = [3.1603   35.4117  100.0000   72.4432   43.3728   31.7514    8.7387    1.9648    1.5428    0.4591];
% b5 = [5.7263   20.0524   23.7083  100.0000   28.5584   11.4715    4.0709    2.3954    4.3768    0.5528];
% 
% c1 = [5.9636  100.0000   32.6246   12.1771    6.3465   35.3740    7.2616    3.3194    1.8048    1.6256];
% c2 = [5.5196  100.0000   22.5811    6.3059    9.1148   15.8212    6.1551    1.5870    0.6131    0.2341];
% c3 = [5.9973  100.0000   45.9813   10.8223    5.6293    3.5699    4.5315    3.6560    1.1871    0.2726];
% c4 = [5.8360  100.0000   23.0315    8.7638    8.8138   36.2252    6.8571    4.1148    0.6376    0.2316];
% c5 = [4.8910  100.0000   24.2242    7.8942   11.8398   56.3849   10.7907    3.1299    0.9078    0.2722];
% 
% d1 = [1.8979  100.0000   45.6775   87.9830   85.7733   37.7107   26.6053   21.3264   10.1884    0.9538];
% d2 = [1.2176  100.0000   65.9911   63.2867   81.8327   53.6828   26.8424   13.4013    3.9594    0.6989];
% d3 = [3.1930   68.9174  100.0000   93.9857   53.8932   69.8747   26.3589   16.0768    3.9789    1.1423];
% d4 = [1.0893  100.0000   62.6058   59.4982   51.4451   52.5261   33.6487   16.3648    4.7948    0.8810];
% d5 = [5.7499  100.0000   88.3736   74.4619   65.2272   66.5348   34.7098   17.3198    3.8160    0.8410];
% 
% e1 = [8.9708   43.9725   38.9870  100.0000   78.7572   76.1749   18.6824    4.3757    2.6319    0.0981];
% e2 = [19.7128  100.0000   33.8163   30.6616    9.3785    2.8147    4.5022    4.0524    2.1862    0.0506];
% e3 = [2.9332   22.6112   55.6194  100.0000   76.9274   63.9717   12.5122    5.9745    5.1374    0.3036];
% e4 = [23.4689  100.0000   43.3542   94.6089   69.8187   70.0200   10.4543    5.7283    2.9186    0.0557];
% e5 = [22.9091   39.7230  100.0000   34.8261   15.3147   25.9830    7.9443    6.2365    8.9043    0.2791];
% 
% f1 = [1.2236  100.0000   57.4168   18.7166   27.7616   12.4129   16.2710    7.9005    2.3307    0.5068];
% f2 = [1.6547  100.0000   78.5547   24.8347   19.0286    8.3089   15.3264    5.6986    1.6136    0.5091];
% f3 = [0.9128  100.0000   40.2762   23.4226   15.1890    9.1421   14.5883    6.5420    1.8294    0.3996];
% f4 = [3.2320   90.1851  100.0000   44.3653   69.3486   29.6772   11.9981    7.9464    4.7599    1.0528];
% f5 = [1.2212  100.0000   85.9493   56.2883   36.4436   12.9032   14.5688    8.6700    5.3630    0.7726];

% Genera matriz de la cancion completa o segmentos
fs = 44100; %frecuencia de muestreo
r = 16;     %bits por muestra
tc = 6;   %tiempo de captura(seg)
canal = 1;  %n�mero del canal

% [x, Fs] =  audioread('billiejean.wav',[1,fs*tc]);
% numMuestras = fs*tc/5;                          %muestras para cada bloque
% x=x';                                           %el codigo de Kemper te lo pide parado
% x1=x(1:numMuestras);
% x2=x(numMuestras+1:2*numMuestras);
% x3=x(2*numMuestras+1:3*numMuestras);
% x4=x(3*numMuestras+1:4*numMuestras);
% x5=x(4*numMuestras+1:5*numMuestras);

%% Agregado para captura por micr�fono
rec = audiorecorder(fs,r,canal);       
disp('Inicia Captura');
record(rec,tc);                         %Capturas la se�al y la guardas en el objeto "rec"
pause(6.5);                             %Pausa de 1 segundo
%El tiempo debe ser adecuado para tomar todas las muestras requeridas
x = getaudiodata(rec);         %guardas los datos capturados del objeto "rect" en un vector "x"
x = x';
%Por defecto es double y mayormente se usa double
%sound(x,44100);                              %Reproduce la se�al capturada
disp('Finaliza captura')
% plot(x); 

%%Obtencion de Subbandas y energ�as por cada bloque
[A91,A92,A82,A72,A62,A52,A42,A32,A22,A12]=subbandas(x);

enerBanda1 = [];
enerBanda1 = [enerBanda1 energia(A91)];
enerBanda1 = [enerBanda1 energia(A92)];
enerBanda1 = [enerBanda1 energia(A82)];
enerBanda1 = [enerBanda1 energia(A72)];
enerBanda1 = [enerBanda1 energia(A62)];
enerBanda1 = [enerBanda1 energia(A52)];
enerBanda1 = [enerBanda1 energia(A42)];
enerBanda1 = [enerBanda1 energia(A32)];
enerBanda1 = [enerBanda1 energia(A22)];
enerBanda1 = [enerBanda1 energia(A12)];

maximo = max(enerBanda1);
for i=1:length(enerBanda1)
    enerBanda1(i) = 100*enerBanda1(i)/maximo;
end;
enerBanda1;    

X=xlsread('XX.xlsx');%'C1:I30'
Y=xlsread('YY.xlsx');
Mdl = fitcknn(X,Y,'NumNeighbors',2,'Standardize',1);%'NumNeighbors''NumNeighbors',2,
flwrClass = predict(Mdl,enerBanda1)

%% Obtencion de Subbandas y energ�as por cada bloque
% 
% [A91,A92,A82,A72,A62,A52,A42,A32,A22,A12]=subbandas(x);
% [B91,B92,B82,B72,B62,B52,B42,B32,B22,B12]=subbandas(x);
% [C91,C92,C82,C72,C62,C52,C42,C32,C22,C12]=subbandas(x);
% [D91,D92,D82,D72,D62,D52,D42,D32,D22,D12]=subbandas(x);
% [E91,E92,E82,E72,E62,E52,E42,E32,E22,E12]=subbandas(x);
% 
% enerBanda1 = [];
% enerBanda1 = [enerBanda1 energia(A91)];
% enerBanda1 = [enerBanda1 energia(A92)];
% enerBanda1 = [enerBanda1 energia(A82)];
% enerBanda1 = [enerBanda1 energia(A72)];
% enerBanda1 = [enerBanda1 energia(A62)];
% enerBanda1 = [enerBanda1 energia(A52)];
% enerBanda1 = [enerBanda1 energia(A42)];
% enerBanda1 = [enerBanda1 energia(A32)];
% enerBanda1 = [enerBanda1 energia(A22)];
% enerBanda1 = [enerBanda1 energia(A12)];
% 
% maximo = max(enerBanda1);               %
% for i=1:length(enerBanda1)
%     enerBanda1(i) = 100*enerBanda1(i)/maximo;
% end;
% enerBanda1;             %%Vector de energ�as de cada subbanda por bloque de canci�n
% 
% enerBanda2 = [];
% enerBanda2 = [enerBanda2 energia(B91)];
% enerBanda2 = [enerBanda2 energia(B92)];
% enerBanda2 = [enerBanda2 energia(B82)];
% enerBanda2 = [enerBanda2 energia(B72)];
% enerBanda2 = [enerBanda2 energia(B62)];
% enerBanda2 = [enerBanda2 energia(B52)];
% enerBanda2 = [enerBanda2 energia(B42)];
% enerBanda2 = [enerBanda2 energia(B32)];
% enerBanda2 = [enerBanda2 energia(B22)];
% enerBanda2 = [enerBanda2 energia(B12)];
% 
% maximo = max(enerBanda2);
% for i=1:length(enerBanda2)
%     enerBanda2(i) = 100*enerBanda2(i)/maximo;
% end;
% enerBanda2;
% 
% 
% enerBanda3 = [];
% enerBanda3 = [enerBanda3 energia(C91)];
% enerBanda3 = [enerBanda3 energia(C92)];
% enerBanda3 = [enerBanda3 energia(C82)];
% enerBanda3 = [enerBanda3 energia(C72)];
% enerBanda3 = [enerBanda3 energia(C62)];
% enerBanda3 = [enerBanda3 energia(C52)];
% enerBanda3 = [enerBanda3 energia(C42)];
% enerBanda3 = [enerBanda3 energia(C32)];
% enerBanda3 = [enerBanda3 energia(C22)];
% enerBanda3 = [enerBanda3 energia(C12)];
% 
% maximo = max(enerBanda3);
% for i=1:length(enerBanda3)
%     enerBanda3(i) = 100*enerBanda3(i)/maximo;
% end;
% enerBanda3;
% 
% enerBanda4 = [];
% enerBanda4 = [enerBanda4 energia(D91)];
% enerBanda4 = [enerBanda4 energia(D92)];
% enerBanda4 = [enerBanda4 energia(D82)];
% enerBanda4 = [enerBanda4 energia(D72)];
% enerBanda4 = [enerBanda4 energia(D62)];
% enerBanda4 = [enerBanda4 energia(D52)];
% enerBanda4 = [enerBanda4 energia(D42)];
% enerBanda4 = [enerBanda4 energia(D32)];
% enerBanda4 = [enerBanda4 energia(D22)];
% enerBanda4 = [enerBanda4 energia(D12)];
% 
% maximo = max(enerBanda4);
% for i=1:length(enerBanda4)
%     enerBanda4(i) = 100*enerBanda4(i)/maximo;
% end;
% enerBanda4;
% 
% 
% enerBanda5 = [];
% enerBanda5 = [enerBanda5 energia(E91)];
% enerBanda5 = [enerBanda5 energia(E92)];
% enerBanda5 = [enerBanda5 energia(E82)];
% enerBanda5 = [enerBanda5 energia(E72)];
% enerBanda5 = [enerBanda5 energia(E62)];
% enerBanda5 = [enerBanda5 energia(E52)];
% enerBanda5 = [enerBanda5 energia(E42)];
% enerBanda5 = [enerBanda5 energia(E32)];
% enerBanda5 = [enerBanda5 energia(E22)];
% enerBanda5 = [enerBanda5 energia(E12)];
% 
% maximo = max(enerBanda5);
% for i=1:length(enerBanda5)
%     enerBanda5(i) = 100*enerBanda5(i)/maximo;
% end;
% enerBanda5;         %%son 5 enerbanda pq son 5 bloques por canci�n
% 
% %% Comparaci�n de la matriz generada por la canci�n con las matrices de las canciones en la BD
% % var1 es que tanto se parece a la canci�n 1, var2 para la cancion2, var3
% % para la cancion 3 y as� hasta var6
% var1 = [];
% var1 = [var1 sum(abs(a1-enerBanda1))];
% var1 = [var1 sum(abs(a2-enerBanda1))];
% var1 = [var1 sum(abs(a3-enerBanda1))];
% var1 = [var1 sum(abs(a4-enerBanda1))];
% var1 = [var1 sum(abs(a5-enerBanda1))];
% var1 = [var1 sum(abs(a1-enerBanda2))];
% var1 = [var1 sum(abs(a2-enerBanda2))];
% var1 = [var1 sum(abs(a3-enerBanda2))];
% var1 = [var1 sum(abs(a4-enerBanda2))];
% var1 = [var1 sum(abs(a5-enerBanda2))];
% var1 = [var1 sum(abs(a1-enerBanda3))];
% var1 = [var1 sum(abs(a2-enerBanda3))];
% var1 = [var1 sum(abs(a3-enerBanda3))];
% var1 = [var1 sum(abs(a4-enerBanda3))];
% var1 = [var1 sum(abs(a5-enerBanda3))];
% var1 = [var1 sum(abs(a1-enerBanda4))];
% var1 = [var1 sum(abs(a2-enerBanda4))];
% var1 = [var1 sum(abs(a3-enerBanda4))];
% var1 = [var1 sum(abs(a4-enerBanda4))];
% var1 = [var1 sum(abs(a5-enerBanda4))];
% var1 = [var1 sum(abs(a1-enerBanda5))];
% var1 = [var1 sum(abs(a2-enerBanda5))];
% var1 = [var1 sum(abs(a3-enerBanda5))];
% var1 = [var1 sum(abs(a4-enerBanda5))];
% var1 = [var1 sum(abs(a5-enerBanda5))];
% var1 = min(var1);
% 
% var2 = [];
% var2 = [var2 sum(abs(b1-enerBanda1))];
% var2 = [var2 sum(abs(b2-enerBanda1))];
% var2 = [var2 sum(abs(b3-enerBanda1))];
% var2 = [var2 sum(abs(b4-enerBanda1))];
% var2 = [var2 sum(abs(b5-enerBanda1))];
% var2 = [var2 sum(abs(b1-enerBanda2))];
% var2 = [var2 sum(abs(b2-enerBanda2))];
% var2 = [var2 sum(abs(b3-enerBanda2))];
% var2 = [var2 sum(abs(b4-enerBanda2))];
% var2 = [var2 sum(abs(b5-enerBanda2))];
% var2 = [var2 sum(abs(b1-enerBanda3))];
% var2 = [var2 sum(abs(b2-enerBanda3))];
% var2 = [var2 sum(abs(b3-enerBanda3))];
% var2 = [var2 sum(abs(b4-enerBanda3))];
% var2 = [var2 sum(abs(b5-enerBanda3))];
% var2 = [var2 sum(abs(b1-enerBanda4))];
% var2 = [var2 sum(abs(b2-enerBanda4))];
% var2 = [var2 sum(abs(b3-enerBanda4))];
% var2 = [var2 sum(abs(b4-enerBanda4))];
% var2 = [var2 sum(abs(b5-enerBanda4))];
% var2 = [var2 sum(abs(b1-enerBanda5))];
% var2 = [var2 sum(abs(b2-enerBanda5))];
% var2 = [var2 sum(abs(b3-enerBanda5))];
% var2 = [var2 sum(abs(b4-enerBanda5))];
% var2 = [var2 sum(abs(b5-enerBanda5))];
% var2 = min(var2);
% 
% var3 = [];
% var3 = [var3 sum(abs(c1-enerBanda1))];
% var3 = [var3 sum(abs(c2-enerBanda1))];
% var3 = [var3 sum(abs(c3-enerBanda1))];
% var3 = [var3 sum(abs(c4-enerBanda1))];
% var3 = [var3 sum(abs(c5-enerBanda1))];
% var3 = [var3 sum(abs(c1-enerBanda2))];
% var3 = [var3 sum(abs(c2-enerBanda2))];
% var3 = [var3 sum(abs(c3-enerBanda2))];
% var3 = [var3 sum(abs(c4-enerBanda2))];
% var3 = [var3 sum(abs(c5-enerBanda2))];
% var3 = [var3 sum(abs(c1-enerBanda3))];
% var3 = [var3 sum(abs(c2-enerBanda3))];
% var3 = [var3 sum(abs(c3-enerBanda3))];
% var3 = [var3 sum(abs(c4-enerBanda3))];
% var3 = [var3 sum(abs(c5-enerBanda3))];
% var3 = [var3 sum(abs(c1-enerBanda4))];
% var3 = [var3 sum(abs(c2-enerBanda4))];
% var3 = [var3 sum(abs(c3-enerBanda4))];
% var3 = [var3 sum(abs(c4-enerBanda4))];
% var3 = [var3 sum(abs(c5-enerBanda4))];
% var3 = [var3 sum(abs(c1-enerBanda5))];
% var3 = [var3 sum(abs(c2-enerBanda5))];
% var3 = [var3 sum(abs(c3-enerBanda5))];
% var3 = [var3 sum(abs(c4-enerBanda5))];
% var3 = [var3 sum(abs(c5-enerBanda5))];
% var3 = min(var3);
% 
% 
% var4 = [];
% var4 = [var4 sum(abs(d1-enerBanda1))];
% var4 = [var4 sum(abs(d2-enerBanda1))];
% var4 = [var4 sum(abs(d3-enerBanda1))];
% var4 = [var4 sum(abs(d4-enerBanda1))];
% var4 = [var4 sum(abs(d5-enerBanda1))];
% var4 = [var4 sum(abs(d1-enerBanda2))];
% var4 = [var4 sum(abs(d2-enerBanda2))];
% var4 = [var4 sum(abs(d3-enerBanda2))];
% var4 = [var4 sum(abs(d4-enerBanda2))];
% var4 = [var4 sum(abs(d5-enerBanda2))];
% var4 = [var4 sum(abs(d1-enerBanda3))];
% var4 = [var4 sum(abs(d2-enerBanda3))];
% var4 = [var4 sum(abs(d3-enerBanda3))];
% var4 = [var4 sum(abs(d4-enerBanda3))];
% var4 = [var4 sum(abs(d5-enerBanda3))];
% var4 = [var4 sum(abs(d1-enerBanda4))];
% var4 = [var4 sum(abs(d2-enerBanda4))];
% var4 = [var4 sum(abs(d3-enerBanda4))];
% var4 = [var4 sum(abs(d4-enerBanda4))];
% var4 = [var4 sum(abs(d5-enerBanda4))];
% var4 = [var4 sum(abs(d1-enerBanda5))];
% var4 = [var4 sum(abs(d2-enerBanda5))];
% var4 = [var4 sum(abs(d3-enerBanda5))];
% var4 = [var4 sum(abs(d4-enerBanda5))];
% var4 = [var4 sum(abs(d5-enerBanda5))];
% var4 = min(var4); 
% 
% var5 = [];
% var5 = [var5 sum(abs(e1-enerBanda1))];
% var5 = [var5 sum(abs(e2-enerBanda1))];
% var5 = [var5 sum(abs(e3-enerBanda1))];
% var5 = [var5 sum(abs(e4-enerBanda1))];
% var5 = [var5 sum(abs(e5-enerBanda1))];
% var5 = [var5 sum(abs(e1-enerBanda2))];
% var5 = [var5 sum(abs(e2-enerBanda2))];
% var5 = [var5 sum(abs(e3-enerBanda2))];
% var5 = [var5 sum(abs(e4-enerBanda2))];
% var5 = [var5 sum(abs(e5-enerBanda2))];
% var5 = [var5 sum(abs(e1-enerBanda3))];
% var5 = [var5 sum(abs(e2-enerBanda3))];
% var5 = [var5 sum(abs(e3-enerBanda3))];
% var5 = [var5 sum(abs(e4-enerBanda3))];
% var5 = [var5 sum(abs(e5-enerBanda3))];
% var5 = [var5 sum(abs(e1-enerBanda4))];
% var5 = [var5 sum(abs(e2-enerBanda4))];
% var5 = [var5 sum(abs(e3-enerBanda4))];
% var5 = [var5 sum(abs(e4-enerBanda4))];
% var5 = [var5 sum(abs(e5-enerBanda4))];
% var5 = [var5 sum(abs(e1-enerBanda5))];
% var5 = [var5 sum(abs(e2-enerBanda5))];
% var5 = [var5 sum(abs(e3-enerBanda5))];
% var5 = [var5 sum(abs(e4-enerBanda5))];
% var5 = [var5 sum(abs(e5-enerBanda5))];
% var5 = min(var5);
% 
% var6 = [];
% var6 = [var6 sum(abs(f1-enerBanda1))];
% var6 = [var6 sum(abs(f2-enerBanda1))];
% var6 = [var6 sum(abs(f3-enerBanda1))];
% var6 = [var6 sum(abs(f4-enerBanda1))];
% var6 = [var6 sum(abs(f5-enerBanda1))];
% var6 = [var6 sum(abs(f1-enerBanda2))];
% var6 = [var6 sum(abs(f2-enerBanda2))];
% var6 = [var6 sum(abs(f3-enerBanda2))];
% var6 = [var6 sum(abs(f4-enerBanda2))];
% var6 = [var6 sum(abs(f5-enerBanda2))];
% var6 = [var6 sum(abs(f1-enerBanda3))];
% var6 = [var6 sum(abs(f2-enerBanda3))];
% var6 = [var6 sum(abs(f3-enerBanda3))];
% var6 = [var6 sum(abs(f4-enerBanda3))];
% var6 = [var6 sum(abs(f5-enerBanda3))];
% var6 = [var6 sum(abs(f1-enerBanda4))];
% var6 = [var6 sum(abs(f2-enerBanda4))];
% var6 = [var6 sum(abs(f3-enerBanda4))];
% var6 = [var6 sum(abs(f4-enerBanda4))];
% var6 = [var6 sum(abs(f5-enerBanda4))];
% var6 = [var6 sum(abs(f1-enerBanda5))];
% var6 = [var6 sum(abs(f2-enerBanda5))];
% var6 = [var6 sum(abs(f3-enerBanda5))];
% var6 = [var6 sum(abs(f4-enerBanda5))];
% var6 = [var6 sum(abs(f5-enerBanda5))];
% var6 = min(var6);
% 
% %% Identificaci�n de la canci�n
% resultado = [var1 var2 var3 var4 var5 var6]
% posicion=find(resultado == min(resultado));
% 
% switch posicion
%     case 1
%         if resultado(posicion)>116
%             disp('Cancion fuera de la BD')
%         else
%             disp('Cancion num:')
%             posicion
%         end
%     case 2
%         if resultado(posicion)>60
%             disp('Cancion fuera de la BD')
%          else
%             disp('Cancion num:')
%             posicion
%         end
%     case 3
%         if resultado(posicion)>30
%             disp('Cancion fuera de la BD')
%         else
%             disp('Cancion num:')
%             posicion    
%         end
%     case 4
%         if resultado(posicion)>118
%             disp('Cancion fuera de la BD')
%         else
%             disp('Cancion num:')
%             posicion
%         end
%     case 5
%         if resultado(posicion)>77   %130
%             disp('Cancion fuera de la BD')
%         else
%             disp('Cancion num:')
%             posicion
%         end
%     case 6
%         if resultado(posicion)>41
%             disp('Cancion fuera de la BD')
%         else
%             disp('Cancion num:')
%             posicion
%         end
% end