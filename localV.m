function [Vx Vy] = localV(Gx,Gy)

    Vy = sum(sum(2*Gx.*Gy),2);
    Vx = sum(sum(Gx.^2-Gy.^2),2);
end