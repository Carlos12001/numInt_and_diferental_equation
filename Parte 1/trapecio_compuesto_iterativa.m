function I = trapecio_compuesto_iterativa(f,a,b,tol=eps,iterMax=2500)
  % Esta funcion realiza la aproximación numérica de la función f 
  % dividida en i subintervalos evaluada desde a hasta b, aplicando 
  % el método del trapecio compuesto a cada subintervalo. Para ello 
  % se debe de indicar una tolerancia que pueda soportar la cota de 
  % error, de manera que se utilice una cantidad de subintervalos que
  %  minimice al máximo estos errores.
  % Sintaxis: I = trapecio_compuesto_iterativa(f,a,b,tol,iterMax)
  % Parametros de entrada:
  % f = función a evaluar
  % a y b = rangos de análisis. a sería el inicial y b el final
  %  ([a,b])
  % tol = tolerancia de error permitida por defecto es el cero de 
  % la máquina
  % iterMax = número máximo de iteraciones permitida por defecto es
  % 2500
  % Parametros de salida
  % I = Aproximación de f por medio del método de trapecio compuesto 
  % iterativo

  I = 0;
  for i = 2:iterMax
    Inew = trapecio_compuesto(f,a,b,i);
    err = Inew - I;
    I = Inew;
    if abs(err) < tol
      break;
    end
  end

end
