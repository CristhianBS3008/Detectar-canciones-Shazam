function [E]=energia(x)

E = 0;
for i=1:length(x)
    E = E + x(i)^2;
end;