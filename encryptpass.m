function em=encryptpass(pass)
 as=double(pass);
 bm=de2bi(as,12);
 key=2;
 rng(key);
 r=randi([0 1],size(bm,1),size(bm,2));
 em=bitxor(bm,r);
