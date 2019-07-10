
data {
  int N;
  int<lower=0, upper=1> A[N]; // A : satisfied with a part-time job : 1 - satisfied / 0 - not satisfied
  real<lower=0, upper=1> Score[N]; // how much interested with in a study
  real<lower=0, upper=1> Y[N]; // An attendance rate
}


parameters {
  real b1;
  real b2;
  real b3;
  real<lower=0> sigma;
}

transformed parameters {
  real mu[N];
  for (n in 1:N)
    mu[n] = b1 + b2*A[n] + b3*Score[n];
}

model {
  for (n in 1:N)
  Y[n] ~ normal(mu[n], sigma);
}

generated quantities{
  real y_pred[N];
  for (n in 1:N)
    y_pred[n] = normal_rng(mu[n], sigma);
}
