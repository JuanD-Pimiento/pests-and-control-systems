function lotka_volterra_liq_dimensional
% LOTKA_VOLTERRA_DIMENSIONAL  Simula un modelo presa–depredador–liquido
% dimensional (tres ecuaciones) con parámetros:
%   dU/dt =  α U − γ U V - p1 U W
%   dV/dt =  ε γ U V − γβ V - p2 V W
%   dW/dt =  -n U W − m V W
% donde
%   U : presas,  V : depredadores,  W : liquido
%   α,β,γ,ε,p1,p2,n,m > 0  son constantes positivas.
% El script genera series temporales de las tres poblaciones y diagramas de
% fase (U vs V y V vs W) para distintos juegos de parámetros.
% -------------------------------------------------------------------------

%% Preparación
clear all; close all; clc;

% Intervalo de integración
t0 = 0;          % tiempo inicial
tf = 80;         % tiempo final

% Conjuntos de parámetros a explorar (tres ejemplos)
params(1) = struct('alpha',1.0,'beta',0.50,'gamma',0.40,'epsilon',0.60, ...
                   'rho1',0.5,'rho2',0.20,'n',0.5,'m',0.2);
params(2) = struct('alpha',0.5,'beta',0.80,'gamma',0.40,'epsilon',0.60, ...
                   'rho1',0.20,'rho2',0.50,'n',0.2,'m',0.5);
params(3) = struct('alpha',0.3,'beta',1,'gamma',0.40,'epsilon',0.60, ...
                   'rho1',0.1,'rho2',0.90,'n',0.9,'m',0.1);

% Condición inicial de referencia
U0 = 10;   % presas
V0 = 5;    % depredadores
W0 = 10;    % liquido

% Ajustes del integrador
options = odeset('RelTol',1e-6,'AbsTol',1e-9);

%% 1) Series temporales ----------------------------------------------------
figure(1);
sgtitle(sprintf('Series temporales. I.C.= $U_{0}=%u$, $V_{0}=%u$, $W_{0}=%u$',U0,V0,W0),'Interpreter','latex');
for k = 1:numel(params)
    p = params(k);
    
    % Resolver el sistema 3×3
    [t,UVW] = ode45(@(t,UVW) lv_dim3(t,UVW,p), [t0 tf], [U0 V0 W0], options);
    U = UVW(:,1); V = UVW(:,2); W = UVW(:,3);

    % Graficar
    subplot(3,1,k);
    plot(t,U,'-', t,V,'--', t,W,':','LineWidth',1.2);
    ylabel('Población');
    title(sprintf(['Rates = [\\alpha=%.2f, \\beta=%.2f, \\gamma=%.2f, ', ...
                   '\\epsilon=%.2f, \\rho_{1}=%.2f, \\rho_{2}=%.2f,n=%.2f,m=%.2f]'], ...
          p.alpha, p.beta, p.gamma, p.epsilon, p.rho1, p.rho2,p.n,p.m));
    grid on;
end
subplot(3,1,1);
legend('Presas (U)','Depredadores (V)','Liquido(W)', ...
       'Location','best');
xlabel('Tiempo');

%% 2) Diagramas de fase U vs V -------------------------------------------
figure(2);
sgtitle(sprintf('U-V. I.C.= $U_{0}=%u$, $V_{0}=%u$, $W_{0}=%u$',U0,V0,W0),'Interpreter','latex');
for k = 1:numel(params)
    p = params(k);
    subplot(1,3,k); hold on; grid on;
    
    % Barrer distintas condiciones iniciales (factor multiplicativo)
    for mult = 0.5:0.25:2.0
        [~,UVW] = ode45(@(t,UVW) lv_dim3(t,UVW,p), [t0 tf], ...
                        [U0*mult V0*mult W0*mult], options);
        plot(UVW(:,1), UVW(:,2));          % U vs V
    end
    axis equal;
    xlabel('Presas  U');
    if k==1, ylabel('Depredadores  V'); end
    title(sprintf('Rates (\\rho_{1}=%.2f, \\rho_{2}=%.2f, n=%.2f, m=%.2f)',p.rho1, p.rho2,p.n,p.m));
end

%% 3) Diagramas de fase V vs W -------------------------------------------
figure(3);
sgtitle(sprintf('V-W. I.C.= $U_{0}=%u$, $V_{0}=%u$, $W_{0}=%u$',U0,V0,W0),'Interpreter','latex');
for k = 1:numel(params)
    p = params(k);
    subplot(1,3,k); hold on; grid on;
    
    for mult = 0.5:0.25:2.0
        [~,UVW] = ode45(@(t,UVW) lv_dim3(t,UVW,p), [t0 tf], ...
                        [U0*mult V0*mult W0*mult], options);
        plot(UVW(:,2), UVW(:,3));          % V vs W
    end
    axis equal;
    xlabel('Depredadores  V');
    if k==1, ylabel('Liquido  W'); end
    title(sprintf('Rates (\\rho_{1}=%.2f, \\rho_{2}=%.2f, n=%.2f, m=%.2f)',p.rho1, p.rho2,p.n,p.m));
end

end  % <-- fin de la función principal

%% -------------------------------------------------------------------------
function dUVW = lv_dim3(~, UVW, p)
% LV_DIM3  Modelo Lotka‑Volterra con tres especies.
%   dU/dt =  α U − γ U V - p1 U W
%   dV/dt =  ε γ U V − γβ V - p2 V W
%   dW/dt =  -n U W − m V W

U = UVW(1);
V = UVW(2);
W = UVW(3);

dUVW = zeros(3,1);
% Presas
dUVW(1) =  p.alpha * U - p.gamma * U * V - p.rho1 * U * W;
% Depredadores
dUVW(2) =  p.epsilon * p.gamma * U * V - p.beta * V -p.rho2 * V * W;
% Super‑depredadores
dUVW(3) =  - p.n * U * W - p.m * V * W;
end
