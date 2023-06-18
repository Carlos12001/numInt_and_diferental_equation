function I = gaussiana_compuesta(f,a,b,m,n)
  % Esta funcion realiza la aproximación numérica de la función f por
  % medio del método de cuadratura gaussiana compuesta
  % Sintaxis: I = gaussiana_compuesta(f,a,b,m,n)
  % Parametros de entrada:
  % f = función a integrar, debe ser string de la manera: "f(x)"
  % a y b = rangos de análisis. a sería el inicial y b el final ([a,b])
  % m = orden de la cuadratura
  % n = puntos en los que se divide el intervalo
  % Parametros de salida
  % I = Aproximación de f por medio del método de cuadratura gaussiana
  % compuesta

  fn=str2func(["@(x) " f]);

  h = (b-a)/(n-1);
  soporte = a:h:b;

  I = 0;

  [x,w]=cerosYpesos(m);

  for i=1:n-1
    I = I + gaussiana(fn, soporte(i), soporte(i+1), x, w);
  end
end

function G = gaussiana(fn, a, b, x, w)
  % Esta funcion realiza la aproximación numérica de la función f por 
  % medio del método de cuadratura gaussiana
  % Sintaxis: G = gaussiana(fn, a, b, x, w)
  % Parametros de entrada:
  % fn = función a integrar, debe ser una función anónima
  % a y b = rangos de análisis. a sería el inicial y b el final ([a,b])
  % x = cero de Legendre de la cuadratura de Gauss
  % w = peso de la cuadratura de Gauss
  % Parametros de salida
  % G = Aproximación de fn por medio del método de cuadratura gaussiana
  len = length(w);

  G=0;
  for k=1:len
    G=G+w(k)*fn( ((b - a) / 2) * x(k) + (b + a) / 2 );
  end
end

function [x,w]=cerosYpesos(n)
  % Esta funcion obtiene los ceros y los pesos de la cuadratura gaussiana
  % Sintaxis: [x,w]=cerosYpesos(n)
  % Parametros de entrada:
  % n = orden de los grados a obtener en base al orden de la cuadratura 
  % gaussiana
  % Parametros de salida
  % x = cero de Legendre de la cuadratura de Gauss
  % w = peso de la cuadratura de Gauss

  switch (n)
  case 1
    x=[0];
    w=[2];
  case 2
    x=[-0.5773502692 0.5773502692];
    w=[1 1];
  case 3
    x=[-0.7745966692 0 0.7745966692];
    w=[0.5555555556 0.8888888889 0.5555555556];
  case 4
    x=[-0.8611363116 -0.3399810436 0.3399810436 0.8611363116];
    w=[0.3478548451 0.6521451549 0.6521451549 0.3478548451];
  case 5
    x=[-0.9061798459 -0.5384693101 0 0.5384693101 0.9061798459];
    w=[0.2369268851 0.4786286705 0.5688888889 0.4786286705 0.2369268851];
  case 6
    x=[-0.9324695142 -0.6612093865 -0.2386191861 0.2386191861 0.6612093865 0.9324695142];
    w=[0.1713244924 0.3607615730 0.4679139346 0.4679139346 0.3607615730 0.1713244924];
  case 7
    x=[-0.9491079123 -0.7415311856 -0.4058451514 0 0.4058451514 0.7415311856 0.9491079123];
    w=[0.1294849662 0.2797053915 0.3818300505 0.4179591837 0.3818300505 0.2797053915 0.1294849662];
  case 8
    x=[-0.9602898565 -0.7966664774 -0.5255324099 -0.1834346425 0.1834346425 0.5255324099 0.7966664774 0.9602898565];
    w=[0.1012285363 0.2223810345 0.3137066459 0.3626837834 0.3626837834 0.3137066459 0.2223810345 0.1012285363];
  case 9
    x=[-0.9681602395 -0.8360311073 -0.6133714327 -0.3242534234 0 0.3242534234 0.6133714327 0.8360311073 0.9681602395];
    w=[0.0812743884 0.1806481607 0.2606106964 0.3123470770 0.3302393550 0.3123470770 0.2606106964 0.1806481607 0.0812743884];
  case 10
    x=[-0.9739065285 -0.8650633666 -0.6794095682 -0.4333953941 -0.1488743389 0.1488743389 0.4333953941 0.6794095682 0.8650633666 0.9739065285];
    w=[0.0666713443 0.1494513491 0.2190863625 0.2692667193 0.2955242247 0.2955242247 0.2692667193 0.2190863625 0.1494513491 0.0666713443];
  end
end
