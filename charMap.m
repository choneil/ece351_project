%charMap.m
%struct of chars matching frequencies which are incremented
%by 50Hz from 20000Hz to 21250Hz
%the struct is saved as chars.mat

chars = struct();
chars.A = 20000;
chars.B = 20050;
chars.C = 20100;
chars.D = 20150;
chars.E = 20200;
chars.F = 20250;
chars.G = 20300;
chars.H = 20350;
chars.I = 20400;
chars.J = 20450;
chars.K = 20500;
chars.L = 20550;
chars.M = 20600;
chars.N = 20650;
chars.O = 20700;
chars.P = 20750;
chars.Q = 20800;
chars.R = 20850;
chars.S = 20900;
chars.T = 20950;
chars.U = 21000;
chars.V = 21050;
chars.W = 21100;
chars.X = 21150;
chars.Y = 21200;
chars.Z = 21250;
chars.a = 20000;
chars.b = 20050;
chars.c = 20100;
chars.d = 20150;
chars.e = 20200;
chars.f = 20250;
chars.g = 20300;
chars.h = 20350;
chars.i = 20400;
chars.j = 20450;
chars.k = 20500;
chars.l = 20550;
chars.m = 20600;
chars.n = 20650;
chars.o = 20700;
chars.p = 20750;
chars.q = 20800;
chars.r = 20850;
chars.s = 20900;
chars.t = 20950;
chars.u = 21000;
chars.v = 21050;
chars.w = 21100;
chars.x = 21150;
chars.y = 21200;
chars.z = 21250;

save('chars.mat', 'chars')