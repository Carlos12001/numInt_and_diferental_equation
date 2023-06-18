function I = simpson_compuesto(f,a,b,n)
  % Esta funcion realiza la aproximación numérica de la función f
  % dividida en n subintervalos evaluada desde a hasta b, aplicando el 
  % método de simpson a cada subintervalo
  % Sintaxis: I = simpson_compuesto(f, a, b, n)
  % Parametros de entrada:
  % f = función a integrar, debe ser string de la manera: "f(x)"
  % a y b = rangos de análisis. a sería el inicial y b el final ([a,b])
  % n = Cantidad de intervalos a dividir de la función f
  % Parametros de salida
  % I = Aproximación de f por medio del método de simpson compuesto
  h = (b-a)/(n-1);
  soporte = a:h:b;

  I = 0;

  for i=1:n-1
    I = I + simpson(f, soporte(i), soporte(i+1));
  end

end

function I = simpson(f, a, b)
  % Esta funcion realiza la aproximación numérica de la función f por 
  % medio del método de simpson
  % Sintaxis: I = simpson(f, a, b)
  % Parametros de entrada:
  % f = función a integrar, debe ser string de la manera: "f(x)"
  % a y b = rangos de análisis. a sería el inicial y b el final ([a,b])
  % Parametros de salida
  % I = Aproximación de f por medio del método de simpson
  fn = str2func(["@(x) " f]);

  I = (b - a) / 6 * (fn(a) + 4 * fn((a+b)/2) + fn(b) );

end
