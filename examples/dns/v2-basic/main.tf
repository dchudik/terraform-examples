terraform {
  required_providers {
    selectel = {
      source  = "selectel/selectel"
      version = "4.0.3"
    }
  }
}

data "selectel_domains_zone_v2" "zone_for_view" {
  name = "tf-provider-basic-data.ru."
}

data "selectel_domains_rrset_v2" "rrset_for_view" {
  name = "a.tf-provider-basic-data.ru."
  type = "A"
  zone_id = data.selectel_domains_zone_v2.zone_for_view.id
}

# Edit zone name to your unique zone name
variable "zone_name" {
  default = "tf-provider-basic.ru."
}

resource "selectel_domains_zone_v2" "tf_basic_ru" {
  name = var.zone_name
}

resource "selectel_domains_rrset_v2" "a_tf_basic_ru" {
  zone_id = selectel_domains_zone_v2.tf_basic_ru.id
  name    = format("a.%s",var.zone_name)
  type    = "A"
  ttl     = 60
  records {
    content  = "127.0.0.1"
  }
  records {
    content  = "127.0.0.3"
    disabled = true
  }
}

resource "selectel_domains_rrset_v2" "aaaa_tf_basic_ru" {
  zone_id = selectel_domains_zone_v2.tf_basic_ru.id
  name    = format("aaaa.%s",var.zone_name)
  type    = "AAAA"
  ttl     = 60
  records {
    content  = "2601:644:500:e210:62f8:1dff:feb8:947a"
  }
}

resource "selectel_domains_rrset_v2" "txt_tf_basic_ru" {
  zone_id = selectel_domains_zone_v2.tf_basic_ru.id
  name    = format("txt.%s",var.zone_name)
  type    = "TXT"
  ttl     = 60
  records {
    content  = "\"Hello terraform\""
  }
}

resource "selectel_domains_rrset_v2" "sshfp_tf_basic_ru" {
  zone_id = selectel_domains_zone_v2.tf_basic_ru.id
  name    = format("sshfp.%s",var.zone_name)
  type    = "SSHFP"
  ttl     = 60
  records {
    content  = "1 1 bf6b6825d2977c511a475bbefb88aad54a92ac73"
  }
  records {
    content  = "1 1 7491973e5f8b39d5327cd4e08bc81b05f7710b49"
  }
}

resource "selectel_domains_rrset_v2" "srv_tf_basic_ru" {
  zone_id = selectel_domains_zone_v2.tf_basic_ru.id
  name    = format("_srv._tcp.%s",var.zone_name)
  type    = "SRV"
  ttl     = 60
  records {
    content  = format("10 20 30 foo-1.%s", var.zone_name)
  }
}

resource "selectel_domains_rrset_v2" "mx_tf_basic_ru" {
  zone_id = selectel_domains_zone_v2.tf_basic_ru.id
  name    = format("mx.%s",var.zone_name)
  type    = "MX"
  ttl     = 60
  records {
    content  = format("10 smtp-1.%s", var.zone_name)
  }
  records {
    content  = format("20 smtp-2.%s", var.zone_name)
  }
}

resource "selectel_domains_rrset_v2" "cname_tf_basic_ru" {
  zone_id = selectel_domains_zone_v2.tf_basic_ru.id
  name    = format("cname.%s",var.zone_name)
  type    = "CNAME"
  ttl     = 60
  records {
    content  = var.zone_name
  }
}

# Edit zone name to your unique zone name
variable "zone_name_alias" {
  default = "tf-provider-basic-alias.ru."
}

resource "selectel_domains_zone_v2" "tf_basic_alias_ru" {
  name = var.zone_name_alias
}

resource "selectel_domains_rrset_v2" "alias_tf_basic_alias_ru" {
  zone_id = selectel_domains_zone_v2.tf_basic_alias_ru.id
  name    = var.zone_name_alias
  type    = "ALIAS"
  ttl     = 60
  records {
    content  = var.zone_name
  }
}
