import sympy as sp
import numpy as np
import matplotlib.pyplot as plt
import time
#Función principal, crea los valores para el ejemplo dado de  y'''= -1/x y' + ((1/4x^2)-1)y
def main():
    x = sp.symbols("x") # se define la variable de cada función
    f=sp.sympify("0") # función F según el ejemplo
    p = sp.sympify("-1/x") # Función p, acompaña a y'
    q = sp.sympify("(1/(4*x**2))-1") # Función q, acompaña a y
    a =1 #inicio del intervalo
    b =6 #fin del intervalo
    y0=1 # valor de y(1)
    yn =0 #valor de y(6)
    valores = [1.5,1, 0.8,0.5,0.3,0.2,10**(-1),0.08,10**(-2),10**(-3)] # Estos son 10 valores diferentes de h para realizar los diferentes casos, se hizo de este modo ya que para valores > a 10**-3 la memoria se agota
    #se inician los calculos de los diferentes puntos para los diferentes valores de paso
    x_,y_=edo2(p,q,f,valores[0],a,b,y0,yn)
    x_1,y_1=edo2(p,q,f,valores[1],a,b,y0,yn)
    x_2,y_2=edo2(p,q,f,valores[2],a,b,y0,yn)
    x_3,y_3=edo2(p,q,f,valores[3],a,b,y0,yn)
    x_4,y_4=edo2(p,q,f,valores[4],a,b,y0,yn)
    x_5,y_5=edo2(p,q,f,valores[5],a,b,y0,yn)
    x_6,y_6=edo2(p,q,f,valores[6],a,b,y0,yn)
    x_7,y_7=edo2(p,q,f,valores[7],a,b,y0,yn)
    x_8,y_8=edo2(p,q,f,valores[8],a,b,y0,yn)
    x_9,y_9=edo2(p,q,f,valores[9],a,b,y0,yn)
    #Se calculan las imagenes de la solución original
    y_0 = funcOriginal(x_6)
    #Se agregan las curvas al gráfico. NOTA: si desea quitar una curva solo comente la linea de la curva que desea eliminar.
    plt.plot(x_6,y_0, label="Gráfica original")
    plt.plot(x_,y_, label="Aproximación con h="+str(valores[0]))
    plt.plot(x_1,y_1, label="Aproximación con h="+str(valores[1]))
    plt.plot(x_2,y_2, label="Aproximación con h="+str(valores[2]))
    plt.plot(x_3,y_3, label="Aproximación con h="+str(valores[3]))
    plt.plot(x_4,y_4, label="Aproximación con h="+str(valores[4]))
    plt.plot(x_5,y_5, label="Aproximación con h="+str(valores[5]))
    plt.plot(x_6,y_6, label="Aproximación con h="+str(valores[6]))
    plt.plot(x_7,y_7, label="Aproximación con h="+str(valores[7]))
    plt.plot(x_8,y_8, label="Aproximación con h="+str(valores[8]))
    plt.plot(x_9,y_9, label="Aproximación con h="+str(valores[9]))
    plt.xlabel('Eje x')
    plt.ylabel('Eje y')
    plt.title('Ecuación diferencial ordinaria de Segundo orden')
    plt.legend()
    plt.show()
# Esta función se encarga de generar la imagenes de la solución del problema
def funcOriginal(val_x):
    y0 = np.zeros(51)
    for i in range(51):
        y0[i] = np.sin(6-val_x[i])/(np.sin(5)*np.sqrt(val_x[i]))
    return y0
# Función que realiza el algoritmo de diferencias finitas
def edo2(p,q,f,h,a,b,y0,yn):
    x = sp.symbols("x")
    elementos = int(((b-a)/h) +1) #se calcula la cantidad de puntos en x y en y.
    #calcular los valores de x
    valores_x = np.zeros(elementos)
    valores_y = np.zeros(elementos)
    valores_x[0]=a
    valores_y=np.zeros(elementos)
    valores_y[0] = y0
    valores_y[elementos-1] = yn
    matriz_coef = np.zeros((elementos-2, elementos-2)) #crea la matriz de coeficientes para los valores de sin tomar en cuenta y0 y yn
    matriz_indep = np.zeros((elementos-2))
    inicio =1
    #Calcula los puntos en x segun el valor de paso
    for i in range(1,elementos):
        x_aux = a+h*i 
        valores_x[i] = x_aux
    #inicia la matriz de coeficientes (tridiagonal), con los valores de X0 
    matriz_coef[0,0] = 2+(h**2)*(q.subs(x,valores_x[0])) 
    matriz_coef[0,1] = ((h/2)*(p.subs(x,valores_x[0])))-1
    matriz_indep[0] = (-(h**2)*(f.subs(x,valores_x[0])))+((((h/2)*(p.subs(x,valores_x[0])))+1)*y0)
    #Este bucle realiza el mismo procedimiento anterior, pero para valores de x1 hasta x elementos -3
    for i in range(1,elementos-3):
        matriz_coef[i,inicio] = 2+(h**2)*(q.subs(x,valores_x[i]))
        matriz_coef[i,inicio-1] = ((-h/2)*(p.subs(x,valores_x[i])))-1
        matriz_coef[i,inicio+1] = ((h/2)*(p.subs(x,valores_x[i])))-1
        matriz_indep[i] = (-(h**2)*(f.subs(x,valores_x[0])))
        inicio +=1
    #Este bucle realiza el mismo procedimiento anterior, pero para valores de x de elementos -2
    matriz_coef[elementos-3,inicio] = 2+(h**2)*(q.subs(x,valores_x[elementos-2]))
    matriz_coef[elementos-3,inicio-1] = ((-h/2)*(p.subs(x,valores_x[elementos-2])))-1
    matriz_indep[elementos-3] = (-(h**2)*(f.subs(x,valores_x[0])))+((((-h/2)*(p.subs(x,valores_x[elementos-2])))+1)*yn)
    valores_y[1:elementos-1] =np.linalg.solve(matriz_coef,matriz_indep) #resuelve el sistema de ecuaciones y lo agrega al vector de imagenes
    return valores_x,valores_y
            
            
    
