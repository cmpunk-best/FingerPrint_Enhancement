function [u,v] = calcuv(ofinal,k,l,w,centeri,centerj,i,j,d)

u=centeri+(d-w/2)*cos(ofinal(i,j))+(k-l/2)*sin(ofinal(i,j));

v=centerj+(d-w/2)*sin(ofinal(i,j))+(l/2-k)*cos(ofinal(i,j));

end