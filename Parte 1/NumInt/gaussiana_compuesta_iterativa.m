function I = gaussiana_compuesta_iterativa(f,a,b,m,tol=eps,iterMax=2500)
  % Esta funcion realiza la aproximación numérica de la función f 
  % dividida en i subintervalos evaluada desde a hasta b, aplicando el 
  % método de la cuadratura gaussiana compuesta a cada subintervalo. 
  % Para ello se debe de indicar una tolerancia que pueda soportar la 
  % cota de error, de manera que se utilice una cantidad de subintervalos
  % que minimice al máximo estos errores.
  % Sintaxis: I = gaussiana_compuesta_iterativa(f,a,b,m,tol,iterMax)
  % Parametros de entrada:
  % f = función a integrar, debe ser string de la manera: "f(x)"
  % a y b = rangos de análisis. a sería el inicial y b el final ([a,b])
  % m = orden de la cuadratura
  % tol = tolerancia de error permitida (por defecto cero de máquina)
  % iterMax = número máximo de iteraciones permitida (por defecto 2500)
  % Parametros de salida
  % I = Aproximación de f por medio del método de cuadratura gaussiana 
  % compuesta iterativa
  I = 0;
  for i = 2:50:iterMax
    Inew = gaussiana_compuesta(f,a,b,m,i);
    err = I - Inew;
    if err < tol
      break;
    end
  end
end
