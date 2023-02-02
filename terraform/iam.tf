# external-dns service account
resource "google_service_account" "external-dns" {
    account_id = "external-dns"
    display_name = "external-dns service account"
}

resource "google_project_iam_member" "external_dns_role_binding" {
    for_each = toset([
        "roles/dns.admin",
        "roles/iam.workloadIdentityUser",
    ])
    
    project = var.project_name
    role = each.key
    member = "serviceAccount:${google_service_account.external-dns.email}"
}

