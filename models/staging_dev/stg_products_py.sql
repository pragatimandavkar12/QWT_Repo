def model (dbt, session):
    products_df = dbt.source("qwt_project","raw_products")
    return products_df