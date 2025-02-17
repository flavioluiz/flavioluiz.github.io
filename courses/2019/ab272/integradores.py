#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Aug 29 17:09:29 2019

Several integrators

@author: flavio
"""


import numpy as np
# euler A
def EulerA(dHdq_func, dHdp_func, Tspan, X0):
    N = int (len(X0)/2)
    Xsol = np.matrix(np.zeros((len(X0), len(Tspan))))
    deltaT = Tspan[1]-Tspan[0]
    Xsol[:,0] = X0
    for i in range(1,len(Tspan)):
        q_n = (Xsol[range(0,N),i-1])
        p_n = (Xsol[range(N,2*N),i-1])
        q_np1 = q_n + deltaT * dHdp_func(p_n)
        p_np1 = p_n - deltaT * dHdq_func(q_np1)
        Xsol[:,i] = np.concatenate((q_np1,p_np1))
    return Xsol

def EulerB(dHdq_func, dHdp_func, Tspan, X0):
    N = int (len(X0)/2)
    Xsol = np.matrix(np.zeros((len(X0), len(Tspan))))
    deltaT = Tspan[1]-Tspan[0]
    Xsol[:,0] = X0
    for i in range(1,len(Tspan)):
        q_n = (Xsol[range(0,N),i-1])
        p_n = (Xsol[range(N,2*N),i-1])
        p_np1 = p_n - deltaT * dHdq_func(q_n)
        q_np1 = q_n + deltaT * dHdp_func(p_np1)
        Xsol[:,i] = np.concatenate((q_np1,p_np1))
    return Xsol

def StormerVerlet(dHdq_func, dHdp_func, Tspan, X0):
    N = int (len(X0)/2)
    Xsol = np.matrix(np.zeros((len(X0), len(Tspan))))
    deltaT = Tspan[1]-Tspan[0]
    Xsol[:,0] = X0
    for i in range(1,len(Tspan)):
        q_n = (Xsol[range(0,N),i-1])
        p_n = (Xsol[range(N,2*N),i-1])
        pi = p_n - deltaT / 2 * dHdq_func(q_n)
        q_np1 = q_n + deltaT * dHdp_func(pi)
        p_np1 = pi - deltaT/2 * dHdq_func(q_np1)
        
        Xsol[:,i] = np.concatenate((q_np1,p_np1))
    return Xsol

def Euler(dinamica, Tspan, X0):
    Xsol = np.matrix(np.zeros((len(X0), len(Tspan))))
    deltaT = Tspan[1]-Tspan[0]
    Xsol[:,0] = X0
    for i in range(1,len(Tspan)):
        Xsol[:,i] = Xsol[:,i-1] + deltaT * dinamica(Tspan[i-1], Xsol[:,i-1])
    return Xsol

def NewtonRaphson(F,JF,X):
    N = 10;
    difference = 10;
    diffTol = 1.e-15
    funcTol = 1.e-15
    i = 1
    while i < N and ((np.linalg.norm(difference)) > diffTol or np.linalg.norm(F(X)) > funcTol):
        difference = np.linalg.inv(JF(X)) * F(X)
        X = X - difference
        i = i + 1
    if i == N:
        print('newton parou antes de convergir')
    return X

def ImplicitEuler(dinamica, Jdinam, Tspan, X0):
    Xsol = np.matrix(np.zeros((len(X0), len(Tspan))))
    deltaT = Tspan[1]-Tspan[0]
    Xsol[:,0] = X0
    for i in range(1,len(Tspan)):
        F = lambda Xsoli: Xsol[:,i-1] + deltaT * dinamica(Tspan[i], Xsoli) - Xsoli
        JF = lambda Xsoli: deltaT * Jdinam(Tspan[i],Xsoli) - np.eye(len(X0))
        Xsol[:,i] = NewtonRaphson(F,JF,Xsol[:,i-1])
    return Xsol

def Trapezoidal(dinamica, Jdinam, Tspan, X0):
    Xsol = np.matrix(np.zeros((len(X0), len(Tspan))))
    deltaT = Tspan[1]-Tspan[0]
    Xsol[:,0] = X0
    for i in range(1,len(Tspan)):
        F = lambda Xsoli: Xsol[:,i-1] + deltaT * (dinamica(Tspan[i], Xsoli) + 
                                                  dinamica(Tspan[i-1], Xsol[:,i-1]) ) / 2 - Xsoli
        JF = lambda Xsoli: deltaT * Jdinam(Tspan[i],Xsoli)/2 - np.eye(len(X0))
        Xsol[:,i] = NewtonRaphson(F,JF,Xsol[:,i-1])
    return Xsol

def Midpoint(dinamica, Jdinam, Tspan, X0):
    Xsol = np.matrix(np.zeros((len(X0), len(Tspan))))
    deltaT = Tspan[1]-Tspan[0]
    Xsol[:,0] = X0
    for i in range(1,len(Tspan)):
        F = lambda Xsoli: Xsol[:,i-1] + deltaT * dinamica((Tspan[i] + Tspan[i-1])/2,
                                                           (Xsoli+Xsol[:,i-1])/2) - Xsoli
        JF = lambda Xsoli: deltaT * Jdinam((Tspan[i] + Tspan[i-1])/2,
                                           (Xsoli+Xsol[:,i-1])/2)/2 - np.eye(len(X0))
        Xsol[:,i] = NewtonRaphson(F,JF,Xsol[:,i-1])
    return Xsol

def RK4(dinamica, Tspan, X0):
    Xsol = np.matrix(np.zeros((len(X0), len(Tspan))))
    deltaT = Tspan[1]-Tspan[0]
    Xsol[:,0] = X0
    for i in range(1,len(Tspan)):
        Z1 = Xsol[:,i-1]
        fZ1 = dinamica(Tspan[i-1], Z1)
        Z2 = Z1 + deltaT/2 * fZ1
        fZ2 = dinamica(Tspan[i-1]+deltaT/2, Z2)
        Z3 = Z1 + deltaT/2 * fZ2
        fZ3 = dinamica(Tspan[i-1]+deltaT/2, Z3)
        Z4 = Z1 + deltaT * fZ3
        Xsol[:,i] = Xsol[:,i-1] + deltaT / 6 * (fZ1+
                                                2*fZ2+
                                                2*fZ3+
                                                dinamica(Tspan[i-1]+deltaT, Z4) )

    return Xsol