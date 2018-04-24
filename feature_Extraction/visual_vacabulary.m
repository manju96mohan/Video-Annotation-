function visual_vacabulary

total_des=DB_siftfet;
K=10;
 [~,C]=kmeans(total_des,K);
save visualword C K;
