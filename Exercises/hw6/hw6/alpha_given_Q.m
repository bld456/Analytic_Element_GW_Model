function [alpha] = alpha_given_Q(zl,rl,Ql,phi, w0)

for i = 1:length(zl)
refz = zl(i)+rl(i);

alpha(i) =sqrt((refz-zl(i))^2 *(phi(i) + w0*refz- conj(w0) * rl(i)*rl(i)/(refz-zl(i)) -(Ql(i)/(2*pi)) * log((refz-zl(i))/rl(i))   )) ;

end
end

