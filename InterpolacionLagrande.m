% FUNCION: Interpolación de Lagrange
function [y_interp, error] = lagrange_interp(x_points, y_points, x_eval, valor_real)

    n = length(x_points);  % Número de puntos
    y_interp = 0;          % Inicializa el resultado

    for i = 1:n
        L = 1;  % Inicializa el polinomio base L_i(x)
        for j = 1:n
            if j ~= i
                % Calcula cada término del producto para L_i(x)
                L = L * (x_eval - x_points(j)) / (x_points(i) - x_points(j));
            end
        end
        % Suma al resultado y_i * L_i(x)
        y_interp = y_interp + y_points(i) * L;
    end

    % Si se desea calcular el error (valor_real no es NaN)
    if ~isnan(valor_real)
        error = abs((y_interp - valor_real) / valor_real) * 100;
    else
        error = NaN;
    end
end

clc; clear; close all;

% Define los puntos para la interpolación
x_points = [1, 4, 6];
y_points = [0, 1.386294, 1.791759];
x_eval = 2;                     % Punto donde queremos interpolar
valor_real = log(2);            % ln(2) como valor real

% Llamada a la función de interpolación
[y1, error1] = lagrange_interp(x_points, y_points, x_eval, valor_real);

% Mostrar el resultado en consola
fprintf('Ejemplo 1: ln(2) ≈ %.4f, Error = %.1f%%\n', y1, error1);
