data {
  (model8-5.stan의 변수)
  int<lower=1, upper=G> GID[N];
}

parameters {
  (model8-5.stan과 같은 변수명이지만 s_a, s_b, s_Y 선언이 다음과 같이 바뀐다)
  real<lower=0> s_a[G];
  real<lower=0> s_b[G];
  real<lower=0> s_Y[G];
}

model {
  for (g in 1:G) {
    a1[g] ~ normal(a0, s_ag);
    b1[g] ~ normal(b0, s_bg);
  }

  for (k in 1:K) {
    a[k] ~ normal(a1[K2G[k]], s_a[K2G[k]]);
    b[k] ~ normal(b1[K2G[k]], s_b[K2G[k]]);
  }

  for (n in 1:N)
    Y[n] ~ normal(a[KID[n]] + b[KID[n]] * X[n], s_Y[GID[n]]);
}
