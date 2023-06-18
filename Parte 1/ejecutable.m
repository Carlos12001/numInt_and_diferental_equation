function ejecutable()
  % Esta funcion se encarga de ejecutar 6 métodos para analiar una función: 
  % Trapecio compuesto, trapecio compuesto iterativo, simpson compuesto, 
  % simpson compuesto iterativo, cuadratura gaussiana compuesta y cuadratura
  % gaussiana compuesta iterativa
  % Sintaxis: ejecutable()
  % Parametros de entrada:
  % no aplica
  % Parametros de salida
  % El resultado de analizar la función 'log(asin(x))/log(x)' con cada uno 
  % de los métodos mencionados previamente
  clc;
  clear;
  
  % Datos de entrada
  f = "log(asin(x))/log(x)";
  a = 0.1;
  b = 0.9;
  n = 20;
  tol = 10e-6;
  iterMax = 2500;
  m = 3;

  warning('off', 'all'); % Turn off warnings

  display("Trapecio compuesto:")
  I = trapecio_compuesto(f, a, b, n)

  display("Trapecio compuesto iterativo:")
  I = trapecio_compuesto_iterativa(f, a, b, tol, iterMax)
  
  display("Simpson compuesto:")
  I = simpson_compuesto(f, a, b, n)

  display("Simpson compuesto iterativo:")
  I = simpson_compuesto_iterativa(f, a, b, tol, iterMax)

  display("Cuadratura gausiana compuesta:")
  I = gaussiana_compuesta(f, a, b, m, n)

  display("Cuadratura gausiana compuesta iterativa:")
  % I = gaussiana_compuesta_iterativa(f, a, b, m, tol, iterMax)

end
