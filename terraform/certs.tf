module "alexandmarissa_dot_com_cert" {
  source      = "./modules/cert"
  zone_name   = "alexandmarissa.com."
  domain_name = "www.alexandmarissa.com."
  alts	      = ["alexandmarissa.com."]
  providers   = {
    aws = "aws.virginia"
  }
}

module "alexrecker_dot_com_cert" {
  source      = "./modules/cert"
  zone_name   = "alexrecker.com."
  domain_name = "alexrecker.com."
  alts	      = [
    "www.alexrecker.com."
  ]
  providers   = {
    aws = "aws.virginia"
  }
}

module "alexrecker_dot_com_archive_cert" {
  source      = "./modules/cert"
  zone_name   = "alexrecker.com."
  domain_name = "archive.alexrecker.com."
  alts	      = []
  providers   = {
    aws = "aws.virginia"
  }
}

module "bobrosssearch_dot_com_cert" {
  source      = "./modules/cert"
  zone_name   = "bobrosssearch.com."
  domain_name = "www.bobrosssearch.com."
  alts	      = ["bobrosssearch.com."]
  providers   = {
    aws = "aws.virginia"
  }
}

module "fromdirktolight_dot_com_cert" {
  source      = "./modules/cert"
  zone_name   = "fromdirktolight.com."
  domain_name = "www.fromdirktolight.com."
  alts	      = ["fromdirktolight.com."]
  providers   = {
    aws = "aws.virginia"
  }
}

module "tranquilitydesignsmn_dot_com_cert" {
  source      = "./modules/cert"
  zone_name   = "tranquilitydesignsmn.com."
  domain_name = "tranquilitydesignsmn.com."
  alts	      = ["www.tranquilitydesignsmn.com", "api.tranquilitydesignsmn.com"]
  providers   = {
    aws = "aws.virginia"
  }
}
