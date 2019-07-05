data {
  int N;
  int M;
  real A[N];
  real R1[M];
}

parameters {
  real a;
  vector[9] r;
}

model {
  a ~ normal(0, 3);
  r ~ normal(0, exp(a/2));
}

generated quantities {
  real lp[N,M];
  for (i in 1:N)
    for (j in 1:M)
      lp[i,j] = 0;
  for (i in 1:N){
    for (j in 1:M){
      lp[i,j] = lp[i,j] + normal_lpdf(A[j] | 0, 3);
      lp[i,j] = lp[i,j] + normal_lpdf(R1[i] | 0, exp(A[j])/2);
    }
  }
}
