
%% Project
%% Clean Up
  clc
  clear all
  close all

%% A:Create a DH table for (PPP-RRR)
  %theta, d, a, alpha, joint type
    L1 = Link([0 0 0 0 1]); %Prismatic
    L2 = Link([0 0 0 -pi/4 1]); %Prismatic
    L3 = Link([0 0 7 pi/3 1]); %Prismatic
    L4 = Link([0 0 0 pi/3 0]); %Revolute
    L5 = Link([0 7 0 -pi/2 0]); %Revolute
    L6 = Link([0 0 0 0 0]); %Revolute
    L1.qlim = [0 9];
    L2.qlim = [0 9];
    L3.qlim = [0 9];
    r = SerialLink([L1 L2 L3 L4 L5 L6])
  
%%  B:Find the forward kinematics matrix
       rob = fkine(r, [ 3 6 2  -pi/3  pi/4  pi/2])
   
%%   C:Find the position (x, y, z) of the end-effector using the first three joints(assume the values)
       ro = fkine(r, [ 3 6 2  0 0 0])
       x = ro.t(1,1)
       y = ro.t(2,1)
       Z = ro.t(3,1)
%%   D:Plot the 6-dof manipulator including the teach function
  
    r.plot([3 5 7 -pi/2 pi/2 pi/4 ], 'workspace', [-30 30 -30 30 -30 30]);
    r.teach();
