function [Q1,Q2]=generatorMSTV(size)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%generate OMTV TV operator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%-----3ODTV-----%%%%%%%%%%%%%%%
[Q2{1},Q2{2},Q2{3},Q2{4},Q2{5},Q2{6}]=generate_90(size);
[Q2{7},Q2{8},Q2{9},Q2{10},Q2{11},Q2{12},Q2{13},Q2{14},Q2{15},Q2{16},Q2{17},Q2{18}]=generate_45(size);%�ԽǷ���
[Q2{19},Q2{20},Q2{21},Q2{22},Q2{23},Q2{24},Q2{25},Q2{26}]=generate_60(size);

%%%%%%%%%%%-----2ODTV-----%%%%%%%%%%%%%%%

s=size*size;
Q1{1}=Q2{1}(:,1:s);
Q1{2}=Q2{2}(:,1:s);
Q1{3}=Q2{3}(:,1:s);
Q1{4}=Q2{4}(:,1:s);
Q1{5}=Q2{7}(:,1:s);
Q1{6}=Q2{8}(:,1:s);
Q1{7}=Q2{9}(:,1:s);
Q1{8}=Q2{10}(:,1:s);
end






