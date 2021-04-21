# Nonlinear_Eqn_Solver
System of nonlinear equations in 2/3 variables.

### Solution of system of nonlinear equations in 2/3 variables using Newton Raphson Method.

It is an iteration method based on N.R. Method. <br>

*Explanation for three variables system* : <br>
Let the system of equations be <br>
**f(x, y, z) = 0 <br>
g(x, y, z) = 0 <br>
h(x, y, z) = 0** and <br>
the initial approximation vector be **I<sub>k</sub> = [x<sub>k</sub>, y<sub>k</sub>, z<sub>k</sub>]<sup>T</sup>**. <br>
It gives the Jacobian matrix **J<sub>k</sub> = [f<sub>x</sub>, f<sub>y</sub>, f<sub>z</sub>; g<sub>x</sub>, g<sub>y</sub>, g<sub>z</sub>; h<sub>x</sub>, h<sub>y</sub>, h<sub>z</sub>]**, <br>
where **f<sub>x</sub>** is the partial derivative of **f** w.r.t **x** at **I<sub>k</sub>**. then, <br>
**I<sub>k+1</sub> = I<sub>k</sub> – J<sub>k</sub><sup>-1</sup>[f<sub>k</sub>, g<sub>k</sub>, h<sub>k</sub>]<sup>T</sup>**<br>
where f<sub>k</sub>, g<sub>k</sub>, h<sub>k</sub> are the values of corresponding equations at I<sub>k</sub>.

