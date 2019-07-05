
data {
  int N;
  real Y[N];
}

parameters {
  real mu;
}

model {
  for (n in 1:N) {
    target += normal_lpdf(Y[n] | mu, 1);
  }
  target += normal_lpdf(mu | 0, 100);
}

