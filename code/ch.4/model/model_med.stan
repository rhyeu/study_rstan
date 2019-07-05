data {
	int<lower=1> N;
	real y[N];
	real x[N];
}
parameters {
	real <lower=0> b0;
	real <lower=0> noise;
}
transformed parameters {
	real theta[N];
	for (j in 1:N){
		theta[j] <- sin(b0 * x[j]);
	}
}
model {
	y ~ normal(theta, noise);
}