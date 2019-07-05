data {
   int N;
   int<lower=0, upper=1> A[N];
   real<lower=0, upper=1> Score[N];
   real<lower=0, upper=1> Y[N];
   int N_new;
   real<lower=0, upper=1> Score_new[N_new];
}

parameters {
   real b0;
   real b1;
   real b2;
   real<lower=0> sigma;
}

transformed parameters {
   real mu[N];
   for (n in 1:N)
      mu[n] <- b0 + b1*A[n] + b2*Score[n];
}

model {
   for (n in 1:N)
      Y[n] ~ normal(mu[n], sigma);
}

generated quantities {
   real y_pred0[N_new];
   real y_pred1[N_new];
   for (n in 1:N_new){
      y_pred0[n] <- normal_rng(b0 + b1*0 + b2*Score_new[n], sigma);
      y_pred1[n] <- normal_rng(b0 + b1*1 + b2*Score_new[n], sigma);
   }
}
