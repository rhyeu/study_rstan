data {
    int<lower=0> N;
    real x1[N];
    real x2[N];
    real x3[N];
    int<lower=1, upper=3> y[N];
  }
  parameters {
    real beta02;
    real beta03;
    real<lower=0> s1;
    real<lower=0> s2;
    real<lower=0> s3;
    real h_mu;
    real<lower=0> sigma;
  }
  model {
    for(i in 1:N) {
      if(y[i] == 1) {
        increment_log_prob(normal_ccdf_log(0.0, x1[i] - (beta02 + x2[i]), sqrt(pow(s1, 2) + pow(s2, 2))));
        increment_log_prob(normal_ccdf_log(0.0, x1[i] - (beta03 + x3[i]), sqrt(pow(s1, 2) + pow(s3, 2))));
      } else if(y[i] == 2) {
        increment_log_prob(normal_ccdf_log(0.0, (beta02 + x2[i]) - x1[i], sqrt(pow(s2, 2) + pow(s1, 2))));
        increment_log_prob(normal_ccdf_log(0.0, (beta02 + x2[i]) - (beta03 + x3[i]), sqrt(pow(s2, 2) + pow(s3, 2))));
      } else {
        increment_log_prob(normal_ccdf_log(0.0, (beta03 + x3[i]) - x1[i], sqrt(pow(s3, 2) + pow(s1, 2))));
        increment_log_prob(normal_ccdf_log(0.0, (beta03 + x3[i]) - (beta02 + x2[i]), sqrt(pow(s3, 2) + pow(s2, 2))));
      }
    }
    beta02 ~ normal(0, 1000);
    beta03 ~ normal(0, 1000);
    s1 ~ normal(h_mu, sigma);
    s2 ~ normal(h_mu, sigma);
    s3 ~ normal(h_mu, sigma);
    h_mu ~ normal(0, 1000);
    sigma ~ cauchy(0, 5);
  }
