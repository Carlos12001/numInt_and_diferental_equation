function I = trapecio_compuesto(f, a, b, n)
  % Esta funcion realiza la aproximación numérica de la función f dividida en n subintervalos evaluada desde a hasta b, aplicando el método del trapecio a cada subintervalo
  % Sintaxis: I = trapecio_compuesto(f, a, b, n)
  % Parametros de entrada:
  % f = función a evaluar
  % a y b = rangos de análisis. a sería el inicial y b el final ([a,b])
  % n = Cantidad de intervalos a dividir de la función f
  % Parametros de salida
  % I = Aproximación de f por medio del método de trapecio compuesto
  h = (b-a)/(n-1);
  soporte = a:h:b;

  I = 0;
  for i = 1 : n - 1
    I = I + trapecio(f, soporte(i), soporte(i+1));
  end
end

function I = trapecio(f, a, b)
  % Esta funcion realiza la aproximación numérica de la función f por medio del método del trapecio
  % Sintaxis: I = trapecio(f, a, b)
  % Parametros de entrada:
  % f = función a evaluar
  % a y b = rangos de análisis. a sería el inicial y b el final ([a,b])
  % Parametros de salida
  % I = Aproximación de f por medio del método de trapecio
  fn=str2func(["@(x)" f]);

  I = (fn(a) + fn(b)) * (b-a) / 2;
end
