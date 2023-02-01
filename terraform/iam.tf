# external-dns service account
resource "google_service_account" "external-dns" {
    account_id = "external-dns"
    display_name = "external-dns service account"
}

resourece "google_project_iam_member" "external_dns_role_binding" {
    project = var.project_name
    role = "roles/dns.admin"
    member = "serviceAccount:${google_service_account.external-dns.email}"
}

