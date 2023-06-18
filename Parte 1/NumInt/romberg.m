function I = romberg(f_str,a,b,n)
  % Esta funcion realiza la aproximación numérica de la integral de la 
  % función f por medio del método de Romberg
  % Sintaxis: I = romberg(f,a,b,n)
  % Parametros de entrada:
  % f = función a integrar, debe ser string de la manera: "f(x)"
  % a y b = Límite inferior y superior de la integral
  % n = Tamaño de la matriz de extrapolación, entre mayor sea n, mejor 
  % la aproximación
  % Parametros de salida
  % I = Aproximación de la integral de la funcion en el orden de convergencia
  % O(h^2n)
  % R = Matriz de extrapolacion
  R = zeros(n, n);
  h = b - a;
  f = str2func(["@(x) " f_str]);
  R(1, 1) = 0.5 * h * (f(a) + f(b));

  for i = 2 : n
    h = h/2;
    sum = 0;
    for k = 1 : 2^(i-2)
      sum = sum + f(a + (k - 0.5) * h);
    end
    R(i, 1) = 0.5 * R(i-1, 1) + h * sum;

    for j = 2 : i
      R(i, j) = R(i, j-1) + (R(i, j-1) - R(i-1, j-1)) / (4^(j-1) - 1);
    end
  end
  R
  I = R(n, n);
end





