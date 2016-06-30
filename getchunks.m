function out = getchunks( in , len )

len = round(len);

cnt = 0;
for i=len:len:length(in(:,1))
    cnt = cnt + 1;
    out{cnt} = in(i-len+1:i,:);

end

