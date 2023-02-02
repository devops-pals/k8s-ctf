# external-dns service account
resource "google_service_account" "external-dns" {
    account_id = "external-dns"
    display_name = "external-dns service account"
}

resource "google_project_iam_member" "external_dns_member" {
    for_each = toset([
        "roles/dns.admin",
    ])
    
    project = var.project_name
    role = each.key
    member = "serviceAccount:${google_service_account.external-dns.email}"
}

resource "google_project_iam_binding" "external-dns-binding" {
    project = var.project_name
    role = "roles/iam.workloadIdentityUser"
    members = [
        "serviceAccount:${var.project_name}.svc.id.goog[external-dns/external-dns]",
    ]
}