# [ES] Análisis de estabilidad de un modelo de Lotka-Volterra bajo la aplicación de pesticidas


Esta investigación consiste en el análisis de estabilidad de un modelo de Lotka-Volterra (LV) bajo la aplicación de pesticidas.
El modelo modificado de Lotka-Volterra que se analiza tiene la forma:

$$\frac{dU(t)}{dt} = \alpha U(t) + \gamma U(t) V(t) - \rho_1 U(t) W(t)$$
$$\frac{dV(t)}{dt} = \epsilon \gamma U(t) V(t) - \beta V(t) - \rho_2 V(t) W(t)$$
$$\frac{dW(t)}{dt} = -W(t)\cdot (n U(t) - m V(t))$$


Donde $U(t)$ y $V(t)$ son las funciones de población de presa y depredador respectivamente, recordando que la población de presa es la población de plaga.
La contante $\alpha$ indica la tasa de natalidad per capita de la población de presa,
y la constante $\beta$ indica la tasa de mortalidad per capita de la población de depredador.
La constante $\gamma$ indica el factor de presas consumidas por depredador por unidad de tiempo. 
Y la constante $\epsilon$ indica el factor de conversión de biomasa de las presas devoradas a crías del depredador [1].
La función $W(t)$ representa la cantidad de pesticida en el sistema a lo largo del tiempo. 
Las constantes $\rho_1$ y $\rho_2$ indican el factor de presas y depredadores muertos a causa del pesticida por cantidad de pesticida respectivamente.
Y Las constantes $n$ y $m$ representan el factor de pesticida consumido por las poblaciones $U(t)$ y $V(t)$ respectivamente.


El código de MATLAB _[ lotka_volterra_liq_dimensional.m ]_ simula la respuesta del modelo LV modificado ante parámetros específicos y gráfica:
* Funciones de población $U(t),V(t)$ y función de cantidad de pesticida $W(t)$ a lo largo del tiempo.
* Diagrama de fase de la población $V(t)$ contra la población $U(t)$
* Diagrama de fase de la cantidad de pesticida $W(t)$ contra la población $V(t)$.

# [EN] Stability Analysis of a Lotka-Volterra Model under Pesticide Application
This research analyze the stability of a Lotka-Volterra (LV) Model under Pesticide Application.
The modified LV model analysed is of the following form:

$$\frac{dU(t)}{dt} = \alpha U(t) + \gamma U(t) V(t) - \rho_1 U(t) W(t)$$
$$\frac{dV(t)}{dt} = \epsilon \gamma U(t) V(t) - \beta V(t) - \rho_2 V(t) W(t)$$
$$\frac{dW(t)}{dt} = -W(t)\cdot (n U(t) - m V(t))$$


Where $U(t)$ y $V(t)$ are the population function of the prey and predator respectively, taking into account that the prey population is the pest population.
The parameter $\alpha$ represents the average per capita birthrate of the prey population.
The parameter $\beta$ represents the average per capita deathrate of the predator population.
The parameter $\gamma$ is the fraction of prey caught per predator per unit time.
And the parameter $\epsilon$ is defined as the conversion factor of biomass from eaten prey to newborn predators [1].
The $W(t)$ function represents the Pesticide amount over time.
The parameters $\rho_1$ y $\rho_2$ are the fraction of the preys and predators dead by pesticide consumption per pesticide amount.
And the $n$ y $m$ represent the fraction of pesticide consumed by $U(t)$ and $V(t)$ populations respectively.


The _[ lotka_volterra_liq_dimensional.m ]_ MATLAB code simulates the response of the modified LV model under specific parameters and plots:
* Population Functions $U(t),V(t)$ and Pesticide amount Function $W(t)$ over time
* Phase diagram of population $V(t)$ against population $U(t)$
* Phase diagram of the pesticide amount $W(t)$ againts populaton $V(t)$

# Referencias / References
[1] J. R. Chasnov, “The Lotka-Volterra predator-prey model,” in Mathematical Biology Lecture notes for MATH 4333, Hong Kong:
The Hong Kong University of Science and Technology, 2009, ch. Population Dynamics, pp. 7–13. [Online]. Available: http://www.math.ust.hk/~machas/mathematical-biology.pdf
