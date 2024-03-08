% Definindo o tamanho dos elos
a1 = 1
a2 = 0.5
% Definindo a posição final desejada 
x_final = -1
y_final = -1
%% Calculando pela cinemática inversa o valor dos angulos nesta posição final
cos_theta2 = (x_final^2 + y_final^2 - a1^2 - a2^2)/(2*a1*a2)
theta2 = acos (cos_theta2)
beta = atan2(y_final,x_final)
alpha = atan2(a2*sin(theta2),(a1 + a2*cos(theta2)))
theta1 = beta - alpha   
%% Simulando o moviento do manipulador
%definindo a janela gráfica
xlim([-2, 2]);
ylim([-2, 2]);
grid on;
% Plot do manipulador de acordo com a variação dos ângulos no tempo
for t = 0:0.05:1
    % Calculando a variação
    varia1 = t * theta1;
    varia2 = t * theta2;
    % Cálculo das posições das juntas dos elos, pela c.d.
    x1 = a1 * cos(varia1);
    y1 = a1 * sin(varia1);
    x2 = a1 * cos(varia1) + a2 * cos(varia1 + varia2);
    y2 = a1 * sin(varia1) + a2 * sin(varia1 + varia2);
    % Plot dos elos
    elo1 = line([0 x1],[0 y1],'linew',4)
    elo2 = line([x1 x2],[y1 y2],'linew',2)
    hold on;
    pause(0.05);
    delete(elo1)
    delete(elo2)
end
   elo1 = line([0 x1],[0 y1],'linew',4)
   elo2 = line([x1 x2],[y1 y2],'linew',2)