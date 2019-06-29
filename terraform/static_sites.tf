data "local_file" "blog_redirects" {
    filename = "${path.module}/redirects/blog.json"
}

module "archive_static_site" {
  source	        = "./modules/static_site"
  prefix	        = "archive-"
  hosted_zone_name      = "alexrecker.com."
  domain_name	        = "archive.alexrecker.com"
  redirect_domain_names = []
  cert_arn	        = "${module.alexrecker_dot_com_archive_cert.arn}"
}

module "bob_static_site" {
  source	        = "./modules/static_site"
  hosted_zone_name      = "bobrosssearch.com."
  domain_name	        = "www.bobrosssearch.com"
  redirect_domain_names = ["bobrosssearch.com"]
  cert_arn	        = "${module.bobrosssearch_dot_com_cert.arn}"
}

module "blog_static_site" {
  source	        = "./modules/static_site"
  hosted_zone_name      = "alexrecker.com."
  domain_name	        = "www.alexrecker.com"
  redirect_domain_names = ["alexrecker.com"]
  cert_arn	        = "${module.alexrecker_dot_com_cert.arn}"
  routing_rules	        = "${data.local_file.blog_redirects.content}"
}

module "demo_static_site" {
  source	   = "./modules/static_site"
  hosted_zone_name = "alexrecker.com."
  domain_name	   = "demo.alexrecker.com"
  cert_arn	   = "${module.alexrecker_dot_com_demo_cert.arn}"
}

module "fdtl_static_site" {
  source	        = "./modules/static_site"
  hosted_zone_name      = "fromdirktolight.com."
  domain_name	        = "www.fromdirktolight.com"
  redirect_domain_names = ["fromdirktolight.com"]
  cert_arn	        = "${module.fromdirktolight_dot_com_cert.arn}"
}

module "sarah_static_site" {
  source	        = "./modules/static_site"
  hosted_zone_name      = "sarahrecker.com."
  domain_name	        = "www.sarahrecker.com"
  redirect_domain_names = ["sarahrecker.com"]
  cert_arn	        = "${module.sarahrecker_dot_com_cert.arn}"
}

module "scrabble_static_site" {
  source	   = "./modules/static_site"
  hosted_zone_name = "sarahrecker.com."
  domain_name	   = "scrabble.sarahrecker.com"
  cert_arn	   = "${module.sarahrecker_dot_com_scrabble_cert.arn}"
}

module "sarah_blog_static_site" {
  source	   = "./modules/static_site"
  hosted_zone_name = "sarahrecker.com."
  domain_name	   = "blog.sarahrecker.com"
  cert_arn	   = "${module.sarahrecker_dot_com_blog_cert.arn}"
}

module "tranquility_static_site" {
  source	        = "./modules/static_site"
  hosted_zone_name      = "tranquilitydesignsmn.com."
  domain_name	        = "www.tranquilitydesignsmn.com"
  redirect_domain_names = ["tranquilitydesignsmn.com"]
  cert_arn	        = "${module.tranquilitydesignsmn_dot_com_cert.arn}"
  error_document        = "404/index.html"
  providers   = {
    aws = "aws.oregon"
  }
}

module "wedding_static_site" {
  source	        = "./modules/static_site"
  hosted_zone_name      = "alexandmarissa.com."
  domain_name	        = "www.alexandmarissa.com"
  redirect_domain_names = ["alexandmarissa.com"]
  cert_arn	        = "${module.alexandmarissa_dot_com_cert.arn}"
}