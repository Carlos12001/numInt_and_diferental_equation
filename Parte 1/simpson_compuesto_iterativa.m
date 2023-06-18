function I = simpson_compuesto_iterativa(f,a,b,tol=eps,iterMax=2500)
  % Esta funcion realiza la aproximación numérica de la función f dividida
  % en i subintervalos evaluada desde a hasta b, aplicando el método de
  % simpson compuesto a cada subintervalo. Para ello se debe de indicar 
  % una tolerancia que pueda soportar la cota de error, de manera que se 
  % utilice una cantidad de subintervalos que minimice al máximo estos 
  % errores.
  % Sintaxis: I = simpson_compuesto_iterativa(f,a,b,tol,iterMax)
  % Parametros de entrada:
  % f = función a evaluar (string)
  % a y b = rangos de análisis. a sería el inicial y b el final ([a,b])
  % tol = tolerancia de error permitida (por defecto es el cero de la máquina)
  % iterMax = número máximo de iteraciones permitida (por defecto 2500)
  % Parametros de salida
  % I = Aproximación de f por medio del método de simpson compuesto iterativo

  I = 0;
  for i = 2:iterMax
    Inew = simpson_compuesto(f,a,b,i);
    err = abs(Inew - I);
    I = Inew;
    if abs(err) < tol
      break;
    end
  end

end
