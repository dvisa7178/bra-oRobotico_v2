% Definindo o tamanho dos elos
a1 = 1
a2 = 1
%variavel que "ditará" a figura
r = sin(2*alpha);
% Definindo a janela gráfica
xlim([-6, 6]);
ylim([-6, 6]);
grid on;
% Definindo os limites da figura (de 0-2pi)
alpha = linspace(0, 2*pi, 100); 
% Transformando x e y para as coordenadas polares da figura
x_figura = r.* cos(alpha);
y_figura = r.* sin(alpha);
% Plotando o manipulador de acordo com a figura desejada
for t = 1:length(y_figura) %pode ser o x_figura também
    %Calcula com base em um dos pontos do vetor do circulo, a nova posição
    %do manipulador
    x_final = x_figura(t);
    y_final = y_figura(t);
    % Calculando pela cinemática inversa o valor dos angulos nesta posição final
    cos_theta2 = (x_final^2 + y_final^2 - a1^2 - a2^2)/(2*a1*a2)
    theta2 = acos (cos_theta2)
    theta1 = atan2(y_final, x_final) - atan2((a2 * sin(theta2)), (a1 + a2 * cos(theta2))); 
    % Cálculo das posições dos elos
    x1 = a1 * cos(theta1);
    y1 = a1 * sin(theta1);
    x2 = a1 * cos(theta1) + a2 * cos(theta1 + theta2);
    y2 = a1 * sin(theta1) + a2 * sin(theta1 + theta2);
    % Plotagem do robô
    plot([0, x1], [0, y1], 'b-', 'LineWidth', 3); % Elo 1
    hold on;
    plot([x1, x2], [y1, y2], 'r-', 'LineWidth', 3); % Elo 2
    % Desenhar a figura
    plot(x_figura, y_figura, 'k', 'LineWidth', 2);
    hold off;
    pause(0.05);
end