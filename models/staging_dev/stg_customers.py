def model(dbt, session):
  customers_df = dbt.source("qwt_project","raw_customers")
  return customers_df