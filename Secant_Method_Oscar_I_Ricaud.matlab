% Oscar I. Ricaud Math 4329: Numerical Analysis
%
% function newton(x0, error_bd, max_iterate)
%
% This is Netwon's method for solving an equation f(x) = 0.
%
% The function f(x) and deriv_f(x) are given below.
% The parameter error_bd is used in the error test for the accuracy
% of each iterate. The parameter max_iterate is an upper limit on the number 
% of iterates to be computed. An initial guess x0 must also be given.
%
% For the given function f(x), an example of calling sequence might be the following:
% 		root = newtin(1, 1.0E-12, 10)
%
% The program prints the iteration values 
%		iterate_number, x, f(x), derive_f(x) error
% The value of x is the most current initial gues,s called
% previous_iterate here, and it is updated with each iteration.
% The value of error is 
%		error = newly_computed_iterate - previous)iterate
% and it is an estimated error for previous_iterate.
% Tap the carriage return to continue with the iteration.
%
function root = Newtons_Method_Oscar_I_Ricaud (x0, error_bd, max_iterate)
format short e
error = 1; 
it_count = 0;
fprintf('\n it_count x f(x) df(x) error \n')

while abs(error) > error_bd && it_count < max_iterate
	fx = f(x0);
	dfx = deriv_f(x0);
	if dfx == 0
		disp('the derivative is zero. Stop')
		return
	end
	x1 = x0 - fx/dfx;
	error = x1 - x0;

% Interal print of the newton method. Tap the carriage
% return key to continue the computation.
	iteration = [it_count x0 fx dfx error];
    pause
    
	x0 = x1;
	it_count = it_count + 1;
    disp(iteration);
   
end

if it_count >= max_iterate
	disp('The number of iterates calculated exceeded')
	disp('max_iterate. An accurate root was not')
	disp('calculated.')
else
	format long
	root = x1;
	format short
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function value = f(x)
% 
% function to define equation for rootfinding problem.
% 
value = x.^3-3*x.^2+3*x-1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function value = deriv_f(x)
%
% Derivative of function defining equation for 
% rootfinding problem.
%
value = 3*x.^2-6*x.^1+3;


