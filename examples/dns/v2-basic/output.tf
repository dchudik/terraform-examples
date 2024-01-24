# Import
output "tf_basic_import_ru_id" {
  value = selectel_domains_zone_v2.tf_basic_import_ru.id
}

output "a_tf_basic_import_ru_id" {
  value = selectel_domains_rrset_v2.a_tf_basic_import_ru.id
}

output "a_tf_basic_import_ru_records" {
  value = selectel_domains_rrset_v2.a_tf_basic_import_ru.records
}

# Datasources
output "zone_for_view_id" {
  value = data.selectel_domains_zone_v2.zone_for_view.id
}

output "rrset_for_view_id" {
  value = data.selectel_domains_rrset_v2.rrset_for_view.id
}

output "rrset_for_view_records" {
  value = data.selectel_domains_rrset_v2.rrset_for_view.records
}

# Resource alias
output "tf_basic_alias_ru_id" {
  value = selectel_domains_zone_v2.tf_basic_alias_ru.id
}

output "alias_tf_basic_alias_ru_id" {
  value = selectel_domains_rrset_v2.alias_tf_basic_alias_ru.id
}

# Resource zone
output "tf_basic_ru_id" {
  value = selectel_domains_zone_v2.tf_basic_ru.id
}

# Resources rrsets
output "a_tf_basic_ru_id" {
  value = selectel_domains_rrset_v2.a_tf_basic_ru.id
}
output "aaaa_tf_basic_ru_id" {
  value = selectel_domains_rrset_v2.aaaa_tf_basic_ru.id
}
output "txt_tf_basic_ru_id" {
  value = selectel_domains_rrset_v2.txt_tf_basic_ru.id
}
output "sshfp_tf_basic_ru_id" {
  value = selectel_domains_rrset_v2.sshfp_tf_basic_ru.id
}
output "srv_tf_basic_ru_id" {
  value = selectel_domains_rrset_v2.srv_tf_basic_ru.id
}
output "mx_tf_basic_ru_id" {
  value = selectel_domains_rrset_v2.mx_tf_basic_ru.id
}