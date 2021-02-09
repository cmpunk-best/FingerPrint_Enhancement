clear all
clc

orientation
% ======================================================
%% Step 1:Calculate the x signature
[row,column]= size(ofinal);
[grow,gcol]=size(theta);
l = 2*w;
multi=1/w;
x=[];
%need to calculate center point for each block
[centerr ,centerc]= getcentermatrix(row,column,w);
uprev=0;vprev=0;count=1;
for i=1:row
    for j=1:column
%         if ofinal(i,j) == 0
%            omega(i,j) = -1;
%             continue;
%         end
        for k =1:l
            
            sumk=0;centeri=centerr(i);centerj=centerc(j);
           for d=1:w
                
                [u,v]=(calcuv(ofinal,k,l,w,centeri,centerj,i,j,d));
                storeduwoc(count)=u;
                storedvwoc(count)=v;
                    u=ceil(u);v=ceil(v);
                 
                if (v<=0) || (v>=(gcol*w))
                    v = vprev;
                end
                if (u<=0) || (u>=(grow*w))
                    u=uprev;
                
                end
                storedu(count)=u;
                storedv(count)=v;
                sumk = G(u,v)+sumk;
                uprev=u;
                vprev=v;
                count=count+1;
            end 
            x(k)=multi*sumk;
        end
     %calculate for each block freq omega
         maxindexes=find(x== max(x));
            if(numel(maxindexes) < 2)
                omega(i,j) =-1;
            else
                value = 1/(maxindexes(2)-maxindexes(1));
                if(value >=(1/25) && value <=(1/3))
                    omega(i,j) = value;
                else
                    omega(i,j) =-1;
                end
            end
        
    end
end
% =====================================================
%% part 2:changing - 1 value








