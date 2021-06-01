function [nzij_pred, nzij_current, nzij_fwrd] = dynamic_g1_nz()
% Returns the coordinates of non-zero elements in the Jacobian, in column-major order, for each lead/lag (only for endogenous)
  nzij_pred = zeros(9, 2, 'int32');
  nzij_pred(1,1)=2; nzij_pred(1,2)=7;
  nzij_pred(2,1)=3; nzij_pred(2,2)=7;
  nzij_pred(3,1)=2; nzij_pred(3,2)=8;
  nzij_pred(4,1)=3; nzij_pred(4,2)=8;
  nzij_pred(5,1)=4; nzij_pred(5,2)=8;
  nzij_pred(6,1)=27; nzij_pred(6,2)=8;
  nzij_pred(7,1)=4; nzij_pred(7,2)=9;
  nzij_pred(8,1)=27; nzij_pred(8,2)=10;
  nzij_pred(9,1)=3; nzij_pred(9,2)=27;
  nzij_current = zeros(132, 2, 'int32');
  nzij_current(1,1)=5; nzij_current(1,2)=1;
  nzij_current(2,1)=6; nzij_current(2,2)=1;
  nzij_current(3,1)=17; nzij_current(3,2)=1;
  nzij_current(4,1)=20; nzij_current(4,2)=1;
  nzij_current(5,1)=28; nzij_current(5,2)=1;
  nzij_current(6,1)=7; nzij_current(6,2)=2;
  nzij_current(7,1)=8; nzij_current(7,2)=2;
  nzij_current(8,1)=18; nzij_current(8,2)=2;
  nzij_current(9,1)=21; nzij_current(9,2)=2;
  nzij_current(10,1)=28; nzij_current(10,2)=2;
  nzij_current(11,1)=9; nzij_current(11,2)=3;
  nzij_current(12,1)=10; nzij_current(12,2)=3;
  nzij_current(13,1)=19; nzij_current(13,2)=3;
  nzij_current(14,1)=22; nzij_current(14,2)=3;
  nzij_current(15,1)=28; nzij_current(15,2)=3;
  nzij_current(16,1)=1; nzij_current(16,2)=4;
  nzij_current(17,1)=11; nzij_current(17,2)=4;
  nzij_current(18,1)=14; nzij_current(18,2)=4;
  nzij_current(19,1)=17; nzij_current(19,2)=4;
  nzij_current(20,1)=30; nzij_current(20,2)=4;
  nzij_current(21,1)=1; nzij_current(21,2)=5;
  nzij_current(22,1)=12; nzij_current(22,2)=5;
  nzij_current(23,1)=15; nzij_current(23,2)=5;
  nzij_current(24,1)=18; nzij_current(24,2)=5;
  nzij_current(25,1)=30; nzij_current(25,2)=5;
  nzij_current(26,1)=1; nzij_current(26,2)=6;
  nzij_current(27,1)=13; nzij_current(27,2)=6;
  nzij_current(28,1)=16; nzij_current(28,2)=6;
  nzij_current(29,1)=19; nzij_current(29,2)=6;
  nzij_current(30,1)=30; nzij_current(30,2)=6;
  nzij_current(31,1)=1; nzij_current(31,2)=7;
  nzij_current(32,1)=2; nzij_current(32,2)=7;
  nzij_current(33,1)=7; nzij_current(33,2)=7;
  nzij_current(34,1)=8; nzij_current(34,2)=7;
  nzij_current(35,1)=15; nzij_current(35,2)=7;
  nzij_current(36,1)=28; nzij_current(36,2)=7;
  nzij_current(37,1)=29; nzij_current(37,2)=7;
  nzij_current(38,1)=30; nzij_current(38,2)=7;
  nzij_current(39,1)=34; nzij_current(39,2)=7;
  nzij_current(40,1)=1; nzij_current(40,2)=8;
  nzij_current(41,1)=2; nzij_current(41,2)=8;
  nzij_current(42,1)=3; nzij_current(42,2)=8;
  nzij_current(43,1)=5; nzij_current(43,2)=8;
  nzij_current(44,1)=6; nzij_current(44,2)=8;
  nzij_current(45,1)=14; nzij_current(45,2)=8;
  nzij_current(46,1)=28; nzij_current(46,2)=8;
  nzij_current(47,1)=29; nzij_current(47,2)=8;
  nzij_current(48,1)=30; nzij_current(48,2)=8;
  nzij_current(49,1)=34; nzij_current(49,2)=8;
  nzij_current(50,1)=1; nzij_current(50,2)=9;
  nzij_current(51,1)=4; nzij_current(51,2)=9;
  nzij_current(52,1)=28; nzij_current(52,2)=9;
  nzij_current(53,1)=29; nzij_current(53,2)=9;
  nzij_current(54,1)=30; nzij_current(54,2)=9;
  nzij_current(55,1)=34; nzij_current(55,2)=9;
  nzij_current(56,1)=27; nzij_current(56,2)=10;
  nzij_current(57,1)=5; nzij_current(57,2)=11;
  nzij_current(58,1)=6; nzij_current(58,2)=11;
  nzij_current(59,1)=7; nzij_current(59,2)=11;
  nzij_current(60,1)=8; nzij_current(60,2)=11;
  nzij_current(61,1)=9; nzij_current(61,2)=11;
  nzij_current(62,1)=10; nzij_current(62,2)=11;
  nzij_current(63,1)=11; nzij_current(63,2)=11;
  nzij_current(64,1)=12; nzij_current(64,2)=11;
  nzij_current(65,1)=13; nzij_current(65,2)=11;
  nzij_current(66,1)=14; nzij_current(66,2)=11;
  nzij_current(67,1)=15; nzij_current(67,2)=11;
  nzij_current(68,1)=16; nzij_current(68,2)=11;
  nzij_current(69,1)=14; nzij_current(69,2)=12;
  nzij_current(70,1)=15; nzij_current(70,2)=12;
  nzij_current(71,1)=15; nzij_current(71,2)=13;
  nzij_current(72,1)=16; nzij_current(72,2)=14;
  nzij_current(73,1)=14; nzij_current(73,2)=15;
  nzij_current(74,1)=17; nzij_current(74,2)=15;
  nzij_current(75,1)=31; nzij_current(75,2)=15;
  nzij_current(76,1)=15; nzij_current(76,2)=16;
  nzij_current(77,1)=18; nzij_current(77,2)=16;
  nzij_current(78,1)=32; nzij_current(78,2)=16;
  nzij_current(79,1)=16; nzij_current(79,2)=17;
  nzij_current(80,1)=19; nzij_current(80,2)=17;
  nzij_current(81,1)=33; nzij_current(81,2)=17;
  nzij_current(82,1)=5; nzij_current(82,2)=18;
  nzij_current(83,1)=7; nzij_current(83,2)=18;
  nzij_current(84,1)=20; nzij_current(84,2)=18;
  nzij_current(85,1)=23; nzij_current(85,2)=18;
  nzij_current(86,1)=26; nzij_current(86,2)=18;
  nzij_current(87,1)=6; nzij_current(87,2)=19;
  nzij_current(88,1)=8; nzij_current(88,2)=19;
  nzij_current(89,1)=20; nzij_current(89,2)=19;
  nzij_current(90,1)=23; nzij_current(90,2)=19;
  nzij_current(91,1)=26; nzij_current(91,2)=19;
  nzij_current(92,1)=5; nzij_current(92,2)=20;
  nzij_current(93,1)=7; nzij_current(93,2)=20;
  nzij_current(94,1)=21; nzij_current(94,2)=20;
  nzij_current(95,1)=24; nzij_current(95,2)=20;
  nzij_current(96,1)=26; nzij_current(96,2)=20;
  nzij_current(97,1)=6; nzij_current(97,2)=21;
  nzij_current(98,1)=8; nzij_current(98,2)=21;
  nzij_current(99,1)=21; nzij_current(99,2)=21;
  nzij_current(100,1)=24; nzij_current(100,2)=21;
  nzij_current(101,1)=26; nzij_current(101,2)=21;
  nzij_current(102,1)=9; nzij_current(102,2)=22;
  nzij_current(103,1)=22; nzij_current(103,2)=22;
  nzij_current(104,1)=25; nzij_current(104,2)=22;
  nzij_current(105,1)=10; nzij_current(105,2)=23;
  nzij_current(106,1)=22; nzij_current(106,2)=23;
  nzij_current(107,1)=25; nzij_current(107,2)=23;
  nzij_current(108,1)=1; nzij_current(108,2)=24;
  nzij_current(109,1)=14; nzij_current(109,2)=24;
  nzij_current(110,1)=23; nzij_current(110,2)=24;
  nzij_current(111,1)=29; nzij_current(111,2)=24;
  nzij_current(112,1)=1; nzij_current(112,2)=25;
  nzij_current(113,1)=15; nzij_current(113,2)=25;
  nzij_current(114,1)=24; nzij_current(114,2)=25;
  nzij_current(115,1)=29; nzij_current(115,2)=25;
  nzij_current(116,1)=1; nzij_current(116,2)=26;
  nzij_current(117,1)=16; nzij_current(117,2)=26;
  nzij_current(118,1)=25; nzij_current(118,2)=26;
  nzij_current(119,1)=29; nzij_current(119,2)=26;
  nzij_current(120,1)=14; nzij_current(120,2)=27;
  nzij_current(121,1)=15; nzij_current(121,2)=27;
  nzij_current(122,1)=26; nzij_current(122,2)=27;
  nzij_current(123,1)=28; nzij_current(123,2)=28;
  nzij_current(124,1)=29; nzij_current(124,2)=29;
  nzij_current(125,1)=30; nzij_current(125,2)=30;
  nzij_current(126,1)=31; nzij_current(126,2)=31;
  nzij_current(127,1)=34; nzij_current(127,2)=31;
  nzij_current(128,1)=32; nzij_current(128,2)=32;
  nzij_current(129,1)=34; nzij_current(129,2)=32;
  nzij_current(130,1)=33; nzij_current(130,2)=33;
  nzij_current(131,1)=34; nzij_current(131,2)=33;
  nzij_current(132,1)=34; nzij_current(132,2)=34;
  nzij_fwrd = zeros(13, 2, 'int32');
  nzij_fwrd(1,1)=14; nzij_fwrd(1,2)=12;
  nzij_fwrd(2,1)=15; nzij_fwrd(2,2)=12;
  nzij_fwrd(3,1)=5; nzij_fwrd(3,2)=13;
  nzij_fwrd(4,1)=6; nzij_fwrd(4,2)=13;
  nzij_fwrd(5,1)=7; nzij_fwrd(5,2)=13;
  nzij_fwrd(6,1)=8; nzij_fwrd(6,2)=13;
  nzij_fwrd(7,1)=14; nzij_fwrd(7,2)=13;
  nzij_fwrd(8,1)=15; nzij_fwrd(8,2)=13;
  nzij_fwrd(9,1)=15; nzij_fwrd(9,2)=14;
  nzij_fwrd(10,1)=16; nzij_fwrd(10,2)=14;
  nzij_fwrd(11,1)=31; nzij_fwrd(11,2)=31;
  nzij_fwrd(12,1)=32; nzij_fwrd(12,2)=32;
  nzij_fwrd(13,1)=33; nzij_fwrd(13,2)=33;
end
