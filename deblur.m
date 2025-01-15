load mypic.jpg
pic=imread("mypic.jpg");
pic=pic(:,:,1);
L=rand(256,256);
[Ua, Sa, Va] = svd(A);
[Ub, Sb, Vb] = svd(B);
Ghat = Ub'*G*Ua;
F1=Ub*Sb*Vb'*F*Va*Sa'*Va';
L1=Ub*Sb*Vb'*L*Va*Sa'*Va';
D=G-F1;
pic=imread("mypic.jpg");
pic=pic(:,:,1);
pic=cast(pic,"like",F);
pic=pic/1000;
pic1=pic;
 10

pic=Ub*Sb*Vb'*pic*Va*Sa'*Va';
pic=pic+D;
pichat=Ub'*pic*Ua;
S = diag(Sb)*(diag(Sa))';
v=zeros(100,1);
x=0.0001:0.0001:0.05;
t=1;
k=10000000000;
l=0;
for xtest=x
 That = (S.*pichat) ./ (S.*S+xtest^2);
 T= Vb*That*Va';
 n=norm(T-pic1,2);
 v(t)=n;
 t=t+1;
 if k>n
k=n;
l=xtest; end
end
plot(x,v)
disp(l)
