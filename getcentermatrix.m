function [centerrow,centercolumn] = getcentermatrix(row,column,w)
stepsr = 1:2:(2*row);
stepsc = 1:2:(2*column);
centerrow = stepsr*(w/2);
centercolumn = stepsc*(w/2);

end