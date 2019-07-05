data {
  int N;  // num of players
  int G;  // num of games
  int<lower=1, upper=N> LW[G, 2];  // loser and winner of each game
}

parameters {
  vector[2] ab[K];
  vector[2] ab0;
  real<lower=0> s_a;
  real<lower=0> s_b;
  real<lower=-1, upper=1> rho;
  real<lower=0> s_Y;
}

transformed parameters {
  vector[K] a;
  vector[K] b;
  matrix[2, 2] cov;
  for (k in 1:K) {
    a[k] = ab[k, 1];
    b[k] = ab[k, 2];
  }
  cov[1, 1] = square(s_a); cov[1, 2] = s_a * s_b * rho;
  cov[2, 1] = s_a * s_b * rho; cov[2, 2] = square(s_b);
}

model {
  ab0[1] ~ normal(4000, 2000);
  ab0[2] ~ normal(150, 150);
  s_a ~ student_t(4, 0, 2000);
  s_b ~ student_t(4, 0, 200);
  ab ~ multi_normal(ab0, cov);
  Y ~ normal(a[KID] + b[KID] .* X, s_Y);
}
