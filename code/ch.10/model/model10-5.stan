data {
  int N;  // num of players
  int G;  // num of games
  int<lower=1, upper=N> LW[G, 2];  // loser and winner of each game
}

parameters {
  vector[2] ab[K];
  vector[2] ab0;
  cov_matrix[2] cov;
  real<lower=0> s_Y;
}

transformed parameters {
  vector[K] a;
  vector[K] b;
  for (k in 1:K) {
    a[k] = ab[k, 1];
    b[k] = ab[k, 2];
  }
}

model {
  ab ~ multi_normal(ab0, cov);
  Y ~ normal(a[KID] + b[KID] .* X, s_Y);
}
