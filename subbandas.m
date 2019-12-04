function [B91,B92,B82,B72,B62,B52,B42,B32,B22,B12]=subbandas(x)

[h0,h1,f0,f1]=wfilters('db25');

[B11,B12]=dwwt(x,h0,h1);
[B21,B22]=dwwt(B11,h0,h1);
[B31,B32]=dwwt(B21,h0,h1);
[B41,B42]=dwwt(B31,h0,h1);
[B51,B52]=dwwt(B41,h0,h1);
[B61,B62]=dwwt(B51,h0,h1);
[B71,B72]=dwwt(B61,h0,h1);
[B81,B82]=dwwt(B71,h0,h1);
[B91,B92]=dwwt(B81,h0,h1);