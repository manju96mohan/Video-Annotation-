function s=decryptpass(em)
  key=2;
  rng(key);
  r=randi([0 1],size(em,1),size(em,2));
  bm=bitxor(em,r);
  d=bi2de(bm,2);
  s=char(d);
  s=s';
